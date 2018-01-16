/*
 * This file is part of the libopencm3 project.
 *
 * (C) Copyright 2015 Greenbot JSC (http://greenbot.io/) and others.
 *
 * All rights reserved. This program and the accompanying materials
 * are made available under the terms of the GNU Lesser General Public License
 * (LGPL) version 2.1 which accompanies this distribution, and is available at
 * http://www.gnu.org/licenses/lgpl-2.1.html
 *
 * Contributors:
 *     Tuan PM <tuanpm@live.com>
 * File: cdcacm.c
 * Created: 8:15:47 AM Nov 17, 2015 GMT+7
 */
#include "config.h"
#include <stdlib.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/usb/usbd.h>
#include <libopencm3/usb/cdc.h>
#include <libopencm3/cm3/scb.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/usart.h>
#include <string.h>
#include "cdcacm.h"
#include "tick.h"
#include "ringbuf.h"

cdcacm_receive_callback _cdcacm_receive_callback = NULL;
static void cdcacm_set_modem_state(usbd_device *usbd_dev, int iface, bool dsr,
                                   bool dcd);

static const struct usb_device_descriptor dev = { .bLength = USB_DT_DEVICE_SIZE,
         .bDescriptorType =
           USB_DT_DEVICE,
           .bcdUSB = 0x0200,
            .bDeviceClass = USB_CLASS_CDC,
             .bDeviceSubClass = 0,
              .bDeviceProtocol = 0,
               .bMaxPacketSize0 = 64,
                .idVendor = 0x0483,
                 .idProduct = 0x5740,
                  .bcdDevice = 0x0200,
                   .iManufacturer = 1,
                    .iProduct = 2,
                     .iSerialNumber = 3,
                      .bNumConfigurations = 1,
};

/*
 * This notification endpoint isn't implemented. According to CDC spec its
 * optional, but its absence causes a NULL pointer dereference in Linux
 * cdc_acm driver.
 */
static const struct usb_endpoint_descriptor comm_endp[] =
{
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x83,
    .bmAttributes = USB_ENDPOINT_ATTR_INTERRUPT,
    .wMaxPacketSize = 16,
    .bInterval = 255,
  }
};

static const struct usb_endpoint_descriptor data_endp[] =
{
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x01,
    .bmAttributes = USB_ENDPOINT_ATTR_BULK,
    .wMaxPacketSize = 64,
    .bInterval = 1,
  },
  {
    .bLength = USB_DT_ENDPOINT_SIZE,
    .bDescriptorType = USB_DT_ENDPOINT,
    .bEndpointAddress = 0x82,
    .bmAttributes = USB_ENDPOINT_ATTR_BULK,
    .wMaxPacketSize = 64,
    .bInterval = 1,
  }
};

static const struct
{
  struct usb_cdc_header_descriptor header;
  struct usb_cdc_call_management_descriptor call_mgmt;
  struct usb_cdc_acm_descriptor acm;
  struct usb_cdc_union_descriptor cdc_union;
} __attribute__((packed)) cdcacm_functional_descriptors =
{
  .header = {
    .bFunctionLength = sizeof(struct usb_cdc_header_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_HEADER,
    .bcdCDC = 0x0110,
  },
  .call_mgmt = {
    .bFunctionLength =
    sizeof(struct usb_cdc_call_management_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_CALL_MANAGEMENT,
    .bmCapabilities = 0,
    .bDataInterface = 1,
  },
  .acm = {
    .bFunctionLength = sizeof(struct usb_cdc_acm_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_ACM,
    .bmCapabilities = 2,
  },
  .cdc_union =
  {
    .bFunctionLength = sizeof(struct usb_cdc_union_descriptor),
    .bDescriptorType = CS_INTERFACE,
    .bDescriptorSubtype = USB_CDC_TYPE_UNION,
    .bControlInterface = 0,
    .bSubordinateInterface0 = 1,
  },
};

static const struct usb_interface_descriptor comm_iface[] =
{
  {
    .bLength = USB_DT_INTERFACE_SIZE,
    .bDescriptorType = USB_DT_INTERFACE,
    .bInterfaceNumber = 0,
    .bAlternateSetting = 0,
    .bNumEndpoints = 1,
    .bInterfaceClass = USB_CLASS_CDC,
    .bInterfaceSubClass = USB_CDC_SUBCLASS_ACM,
    .bInterfaceProtocol = USB_CDC_PROTOCOL_AT,
    .iInterface = 0,

    .endpoint = comm_endp,

    .extra = &cdcacm_functional_descriptors,
    .extralen = sizeof(cdcacm_functional_descriptors),
  }
};

static const struct usb_interface_descriptor data_iface[] =
{
  {
    .bLength = USB_DT_INTERFACE_SIZE,
    .bDescriptorType = USB_DT_INTERFACE,
    .bInterfaceNumber = 1,
    .bAlternateSetting = 0,
    .bNumEndpoints = 2,
    .bInterfaceClass = USB_CLASS_DATA,
    .bInterfaceSubClass = 0,
    .bInterfaceProtocol = 0,
    .iInterface = 0,

    .endpoint = data_endp,
  }
};

static const struct usb_interface ifaces[] = {  {
    .num_altsetting = 1,
    .altsetting = comm_iface,
  },
  {
    .num_altsetting = 1,
    .altsetting = data_iface,
  }
};

static const struct usb_config_descriptor config =
{
  .bLength = USB_DT_CONFIGURATION_SIZE,
  .bDescriptorType = USB_DT_CONFIGURATION,
  .wTotalLength = 0,
  .bNumInterfaces = 2,
  .bConfigurationValue = 1,
  .iConfiguration = 0,
  .bmAttributes = 0x80,
  .bMaxPower = 0x32,

  .interface = ifaces,
};

static const char *usb_strings[] = {  "Tuan PM",
                                      "CDC-ACM Demo",
                                      "DEMO",
                                   };

/* Buffer to be used for control requests. */
/*
uint8_t usbd_control_buffer[128];
uint8_t usbd_tx_buf[512];
volatile uint32_t usbd_tx_len = 0, cdcacm_ready = 0;
*/
static cdc_dev cdc;

static int cdcacm_control_request(usbd_device *usbd_dev,
                                  struct usb_setup_data *req, uint8_t **buf, uint16_t *len,
                                  void (**complete)(usbd_device *usbd_dev, struct usb_setup_data *req))
{
  (void) complete;
  (void) buf;
  (void) usbd_dev;

  switch (req->bRequest)
  {
    case USB_CDC_REQ_SET_CONTROL_LINE_STATE:

      //cdcacm_set_modem_state(usbd_dev, req->wIndex, true, true);

      //if (req->wValue & 0x01) //DTR

      //if (req->wValue & 0x02) //RTS

      return 1;

    case USB_CDC_REQ_SET_LINE_CODING:

      if (*len < sizeof(struct usb_cdc_line_coding))
        return 0;

      // switch (req->wIndex)
      // {
      //   case 2:
      //   //usbuart_set_line_coding((struct usb_cdc_line_coding*)*buf);
      //   case 0:
      //     return 0; /* Ignore on GDB Port */
      //   default:
      //     return 0;
      // }
      return 1;
  }
  return 0;
}

static void cdcacm_set_modem_state(usbd_device *usbd_dev, int iface, bool dsr,
                                   bool dcd)
{
  char buf[10];
  struct usb_cdc_notification *notif = (void*) buf;

  /* We echo signals back to host as notification */
  notif->bmRequestType = 0xA1;
  notif->bNotification = USB_CDC_NOTIFY_SERIAL_STATE;
  notif->wValue = 0;
  notif->wIndex = iface;
  notif->wLength = 2;
  buf[8] = (dsr ? 2 : 0) | (dcd ? 1 : 0);
  buf[9] = 0;
  usbd_ep_write_packet(usbd_dev, 0x82 + iface, buf, 10);
}
static void cdcacm_data_rx_cb(usbd_device *usbd_dev, uint8_t ep)
{
  (void) ep;
  char buf[64], i;
  int len = usbd_ep_read_packet(usbd_dev, 0x01, buf, 64);

  usbd_ep_write_packet(usbd_dev, 0x82, buf, len) ;

  for (i = 0; i < len; i++)
  {
    cdcacm_input(buf[i]);
    //gpio_toggle(GPIOC, GPIO13);
    //usart_send_blocking(USART2, buf[i]);
  }

}
static void cdcacm_data_tx_cb(usbd_device *usbd_dev, uint8_t ep)
{
  /*
  if (usbd_tx_len >= 64)
  {
    usbd_tx_len -= 64;
    cdcacm_send(usbd_tx_buf, 64);
  }
  */
}
static void cdcacm_set_config(usbd_device *usbd_dev, uint16_t wValue)
{
  (void) wValue;
  (void) usbd_dev;

  usbd_ep_setup(usbd_dev, 0x01, USB_ENDPOINT_ATTR_BULK, 64, cdcacm_data_rx_cb);
  usbd_ep_setup(usbd_dev, 0x82, USB_ENDPOINT_ATTR_BULK, 64, cdcacm_data_tx_cb);
  usbd_ep_setup(usbd_dev, 0x83, USB_ENDPOINT_ATTR_INTERRUPT, 16, NULL);

  usbd_register_control_callback(usbd_dev,
                                 USB_REQ_TYPE_CLASS | USB_REQ_TYPE_INTERFACE,
                                 USB_REQ_TYPE_TYPE | USB_REQ_TYPE_RECIPIENT, cdcacm_control_request);

  cdc.ready = wValue;
}



void cdcacm_init(void)
{
  /* Setup GPIOC Pin 12 to pull up the D+ high, so autodect works
   * with the bootloader.  The circuit is active low. */
  gpio_set_mode(GPIOA, GPIO_MODE_OUTPUT_2_MHZ, GPIO_CNF_OUTPUT_PUSHPULL, GPIO8);
  gpio_clear(GPIOA, GPIO8);
  cdc.usbd_dev = usbd_init(&st_usbfs_v1_usb_driver, &dev, &config, usb_strings, 3,
                           cdc.usbd_control_buffer, sizeof(cdc.usbd_control_buffer));
  usbd_register_set_config_callback(cdc.usbd_dev, cdcacm_set_config);

  tick_wait_ms(2000);

  gpio_set(GPIOA, GPIO8);


  //gpio_set_mode(GPIOA GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_ALTFN_PUSHPULL, GPIO_USART2_TX);

  /* Setup GPIO pin GPIO_USART2_RE_RX on GPIO port A for receive. */
  //gpio_set_mode(GPIOA, GPIO_MODE_INPUT, GPIO_CNF_INPUT_FLOAT, GPIO_USART2_RX);

  //  /* Setup UART parameters. */
  // nvic_disable_irq(NVIC_USART2_IRQ);
  // usart_set_baudrate(USART2, 115200);
  // usart_set_databits(USART2, 8);
  // usart_set_stopbits(USART2, USART_STOPBITS_1);
  // usart_set_parity(USART2, USART_PARITY_NONE);
  // usart_set_flow_control(USART2, USART_FLOWCONTROL_NONE);
  // usart_set_mode(USART2, USART_MODE_TX_RX);

  // /* Enable USART2 Receive interrupt. */
  // USART_CR1(USART2) |= USART_CR1_RXNEIE;
  // USART_CR1(USART2) &= ~USART_CR1_TXEIE;



  ringbuf_init(&cdc.tx_rb, cdc.rbtx_buf, sizeof(cdc.rbtx_buf));
  cdc.tick = tick_get();
  cdc.ready = 0;
  cdc.tx_len = 0;

  //  /* Finally enable the USART. */
  // usart_enable(USART2);
  // nvic_enable_irq(NVIC_USART2_IRQ);
  nvic_enable_irq(NVIC_USB_LP_CAN_RX0_IRQ);
  nvic_enable_irq(NVIC_USB_WAKEUP_IRQ);
  nvic_set_priority(NVIC_USB_LP_CAN_RX0_IRQ, 4);
  nvic_set_priority(NVIC_USB_WAKEUP_IRQ, 3);
}

// void usart2_isr(void)
// {
//   uint8_t data;

//   /* Check if we were called because of RXNE. */
//   if (((USART_CR1(USART2) & USART_CR1_RXNEIE) != 0) &&
//       ((USART_SR(USART2) & USART_SR_RXNE) != 0))
//   {


//     /* Retrieve the data from the peripheral. */
//     data = usart_recv(USART2);
//     cdcacm_input(data);
//      Enable transmit interrupt so it sends back the data. 
//     //USART_CR1(USART2) |= USART_CR1_TXEIE;
//   }

//   /* Check if we were called because of TXE. */
//   if (((USART_CR1(USART2) & USART_CR1_TXEIE) != 0) &&
//       ((USART_SR(USART2) & USART_SR_TXE) != 0))
//   {


//     /* Disable the TXE interrupt as we don't need it anymore. */
//     USART_CR1(USART2) &= ~USART_CR1_TXEIE;
//   }
// }

//0x55*32 = SYNC command
void cdcacm_manage(void)
{
  uint8_t temp_data;
  if(cdc.ready == 0)
    return;
  while (cdc.tx_len < 64 && ringbuf_get(&cdc.tx_rb, &temp_data))
  {
    cdc.tx_buf[cdc.tx_len++] = temp_data;
  }

  if (cdc.tx_len != 0)
  {
    if (usbd_ep_write_packet(cdc.usbd_dev, 0x82, cdc.tx_buf, cdc.tx_len) == 0)
      return;
    cdc.tx_len = 0;
  }
  //usbd_poll(cdc.usbd_dev);
}

void cdcacm_send(char *data)
{
  uint8_t size = strlen(data);
  usbd_ep_write_packet(cdc.usbd_dev, 0x82, data, size);
}

void cdcacm_rx_callback(cdcacm_receive_callback callback)
{
  _cdcacm_receive_callback = callback;
}

void cdcacm_info(uint8_t *buff)
{
  uint8_t i;
  if(cdc.ready == 0)
    return;
  for (i = 0; i < strlen(buff); i++)
  {
    cdcacm_input(buff[i]);
  }
}

void cdcacm_input(uint8_t data)
{
  uint8_t temp;
  if(ringbuf_put(&cdc.tx_rb, data) == 0)
  {
    ringbuf_get(&cdc.tx_rb, &temp);
    ringbuf_put(&cdc.tx_rb, data);
  }

}

void usb_wakeup_isr(void)
{
  usbd_poll(cdc.usbd_dev);
}

void usb_lp_can_rx0_isr(void)
{
  usbd_poll(cdc.usbd_dev);
}

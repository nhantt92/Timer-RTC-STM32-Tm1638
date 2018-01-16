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
 * File: cdcacm.h
 * Created: 8:15:47 AM Nov 17, 2015 GMT+7
 */



#ifndef CDCACM_H
#define CDCACM_H
#include "ringbuf.h"
#include <libopencm3/usb/usbd.h>
typedef struct
{
  ringbuf tx_rb;
  usbd_device *usbd_dev;
  uint8_t usbd_control_buffer[128];
  uint8_t rbtx_buf[512];
  uint8_t tx_buf[64];
  uint32_t tx_len;
  uint32_t tick;
  uint32_t ready;
} cdc_dev;

typedef void (*cdcacm_receive_callback) (char *data, int size);

void cdcacm_init(void);
void cdcacm_manage(void);
void cdcacm_send(char *data);
void cdcacm_rx_callback(cdcacm_receive_callback callback);
void cdcacm_input(uint8_t data);
void cdcacm_info(uint8_t *buff);
#endif /* CDCACM_H */

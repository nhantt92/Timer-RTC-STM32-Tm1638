#include "config.h"
#include <stdlib.h>
#include <string.h>

#include <errno.h>
#include <stdio.h>
#include <unistd.h>
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/usart.h>
#include <libopencm3/stm32/exti.h>
#include <libopencm3/stm32/spi.h>
#include <libopencm3/stm32/iwdg.h>
#include "debug.h"
#include "cdcacm.h"
#include "tick.h"

static void clock_init(void);
static void iwd_init(void);

/* Output for printf */
int _write(int file, char *ptr, int len);
int _write(int file, char *ptr, int len)
{
  int i;
  if(file == STDOUT_FILENO || file == STDERR_FILENO)
  {
    for (i = 0; i < len; i++)
    {
      if (ptr[i] == '\n')
      {
        cdcacm_input('\r');
      }
      cdcacm_input(ptr[i]);
    }
    return i;
  }
  errno = EIO;
  return -1;
}

int main(void)
{
  clock_init();
  tick_init();
  cdcacm_init();
  iwd_init();
  while(1)
  { 
    cdcacm_manage();
    iwdg_reset();
  }
}

static void iwd_init(void)
{
  iwdg_reset();
  iwdg_set_period_ms(500);
  iwdg_start();
}

static void clock_init(void)
{
  rcc_clock_setup_in_hse_8mhz_out_72mhz();
  rcc_periph_clock_enable(RCC_GPIOA);
  rcc_periph_clock_enable(RCC_GPIOB);
  rcc_periph_clock_enable(RCC_GPIOC);
  rcc_periph_clock_enable(RCC_GPIOD);
  rcc_periph_clock_enable(RCC_USART1);
  //rcc_periph_clock_enable(RCC_USART2);
  rcc_periph_clock_enable(RCC_AFIO);
  //rcc_periph_clock_enable(RCC_I2C2);
  gpio_primary_remap(AFIO_MAPR_SWJ_CFG_JTAG_OFF_SW_ON, 0);
}

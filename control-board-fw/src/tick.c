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
 * File: tick.c
 * Created: 8:15:47 AM Nov 17, 2015 GMT+7
 */


#include "config.h"
#include <libopencm3/stm32/rcc.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/cm3/systick.h>
#include <libopencm3/cm3/scs.h>
#include "tick.h"

volatile uint32_t g_ulSysTickCount;
uint32_t g_NbCyclePerSecond;

static void scs_dwt_cycle_counter_enabled(void)
{
  SCS_DEMCR |= SCS_DEMCR_TRCENA;
  SCS_DWT_CTRL  |= SCS_DWT_CTRL_CYCCNTENA;
}

void tick_init(void)
{
  uint32_t systick_reload_val;
  g_ulSysTickCount = 0;

  /* Disable IRQ globally */
  asm volatile ("cpsid i");

  /* Set processor Clock as Source Clock */
  systick_set_clocksource(STK_CSR_CLKSOURCE_AHB);

  systick_set_reload(rcc_ahb_frequency / 1000);

  systick_interrupt_enable();

  /* Start counting. */
  systick_counter_enable();

  /* Set SysTick Priority to maximum */
  nvic_set_priority(NVIC_SYSTICK_IRQ, 255);

  /* Enable IRQ globally */
  asm volatile ("cpsie i");
  scs_dwt_cycle_counter_enabled();

}

uint32_t tick_get(void )
{
  return g_ulSysTickCount;
}
uint32_t tick_get_tick(void )
{
  return systick_get_value();
}
static uint32_t tick_delta_time_ms(uint32_t start, uint32_t end)
{
#define MAX_T_U32 ((2^32)-1)
  uint32_t diff;

  if (end > start)
  {
    diff = end - start;
  }
  else
  {
    diff = MAX_T_U32 - (start - end) + 1;
  }

  return diff;
}

uint32_t tick_delta_time_tick(uint32_t start, uint32_t end)
{

  uint32_t reload_val = systick_get_reload() - 1;
  uint32_t diff;

  if (end > start)
  {
    diff = end - start;
  }
  else
  {
    diff = reload_val - (start - end) + 1;
  }

  return diff;
}
void tick_wait_us(uint32_t wait_us)
{
  uint32_t start;

  start = systick_get_value();

  while (tick_expire_us(&start, wait_us) == 0);
}
void tick_wait_ms(uint32_t wait_ms)
{
  uint32_t start, end;
  uint32_t tickms;

  start = tick_get();

  while (tick_expire_ms(&start, wait_ms) == 0);
}

uint8_t tick_expire_ms(uint32_t *last_tick, uint32_t time_ms)
{
  uint32_t tickms, end;
  end = tick_get();
  tickms = tick_delta_time_ms(*last_tick, end);
  if (tickms < time_ms) return 0;
  *last_tick = tick_get();
  return 1;
}

uint8_t tick_expire_us(uint32_t *last_tick, uint32_t time_us)
{
  uint32_t tickus, end;
  time_us *= 72;
  end = systick_get_value();
  tickus = tick_delta_time_tick(end, *last_tick);
  if (tickus < time_us) return 0;
  *last_tick = systick_get_value();
  return 1;
}
/* Called each 1ms/1000Hz by interrupt
 1) Count the number of cycle per second.
 2) Increment g_ulSysTickCount counter.
*/

void sys_tick_handler(void)
{
  if (g_ulSysTickCount == 0)
  {
    /* Clear Cycle Counter*/
    SCS_DWT_CYCCNT = 0;
  }
  else if (g_ulSysTickCount == 1000)
  {
    /* Capture number of cycle elapsed during 1 second */
    g_NbCyclePerSecond = SCS_DWT_CYCCNT;
  }

  g_ulSysTickCount++;
}

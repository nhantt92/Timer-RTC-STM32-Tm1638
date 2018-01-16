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
 * File: tick.h
 * Created: 8:15:47 AM Nov 17, 2015 GMT+7
 */




#ifndef INCLUDE_TICK_H_
#define INCLUDE_TICK_H_

void tick_init(void);
uint32_t tick_get(void);
void tick_wait_ms(uint32_t wait_ms);
uint8_t tick_expire_ms(uint32_t *last_tick, uint32_t time_ms);
void tick_wait_us(uint32_t wait_us);
uint8_t tick_expire_us(uint32_t *last_tick, uint32_t time_us);
uint32_t tick_get_tick(void);
uint32_t tick_delta_time_tick(uint32_t start, uint32_t end);

#endif /* INCLUDE_TICK_H_ */

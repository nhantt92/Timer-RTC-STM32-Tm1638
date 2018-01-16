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
 * File: ringbuf.h
 * Created: 2:12:12 PM Nov 17, 2015 GMT+7
 */
#ifndef INCLUDE_RINGBUF_H_
#define INCLUDE_RINGBUF_H_

typedef struct
{
	uint8_t *buf;
	uint32_t size;
	uint32_t pw;
	uint32_t pr;
} ringbuf;

void ringbuf_init(ringbuf *rb, uint8_t *buf, uint32_t size);
uint32_t ringbuf_get(ringbuf *rb, uint8_t *data);
uint32_t ringbuf_put(ringbuf *rb, uint8_t data);
#endif /* INCLUDE_RINGBUF_H_ */

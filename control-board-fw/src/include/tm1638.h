#ifndef __TM1638_H_
#define __TM1638_H_

#include <libopencm3/stm32/rcc.h>
#include <libopencm3/cm3/nvic.h>
#include <libopencm3/stm32/gpio.h>
#include <libopencm3/stm32/usart.h>
#include <libopencm3/stm32/exti.h>
#include <libopencm3/stm32/spi.h>
#include <libopencm3/stm32/iwdg.h>

typedef struct
{
	uint32_t gpioport;
	uint16_t StbPin;
	uint16_t ClkPin;
	uint16_t DataPin;
	uint8_t intensity; //current Led brightness
	uint8_t displays; // number led
	bool active; // enable 
}TM1638_Struct;

void TM1638_Init(uint32_t gpioport, uint16_t StbPin, uint16_t ClkPin, uint16_t DataPin);
void sendChar(uint8_t pos, uint8_t data, bool dot);
void configDisplay(bool active, uint8_t intensity);
void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[]);
void clearDisplayDigit(uint8_t pos, bool dot);
void setDisplay(const uint8_t values[], uint8_t size);
void clearDisplay(void);
void displayNumber(uint8_t pos, uint8_t number, bool dot);
uint8_t getKey(void);
void setLed(uint8_t color, uint8_t pos);

#endif
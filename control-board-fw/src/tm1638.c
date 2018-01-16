#include "tm1638.h"

const uint8_t NUMBER_FONT[] = {
  0x3F, //0
  0x06, //1
  0x5B, //2
  0x4F, //3
  0x66, //4
  0x6D, //5
  0x7D, //6
  0x07, //7
  0x7F, //8
  0x6F, //9
  0x77, //A
  0x7C, //B
  0x39, //C
  0x5E, //D
  0x79, //E
  0x71 //F
};
const uint8_t ERROR_DATA[] = {
  0x79,// E
  0x50,// r
  0x50,// r
  0x5c,// o
  0x50,// r
  0x00,
  0x00,
  0x00
};


TM1638_Struct tm1638;

#define Set(pin) gpio_set(tm1638.gpioport, (pin))
#define Reset(pin) gpio_clear(tm1638.gpioport, (pin))
#define Get(pin) gpio_get(tm1638.gpioport, (pin))

static void writeByte(uint8_t byte);
static uint8_t readByte(void);
static void writeCmd(uint8_t cmd);
static void writeData(uint8_t addr, uint8_t data);


void TM1638_Init(uint32_t gpioport, uint16_t StbPin, uint16_t ClkPin, uint16_t DataPin)
{
	uint8_t i;
	tm1638.gpioport = gpioport;
	tm1638.StbPin = StbPin;
	tm1638.ClkPin = ClkPin;
	tm1638.DataPin = DataPin;
	tm1638.intensity = 4;
	tm1638.displays = 8;
	tm1638.active = 1;
	gpio_set_mode(tm1638.gpioport, GPIO_MODE_OUTPUT_50_MHZ, GPIO_CNF_OUTPUT_OPENDRAIN,
		     tm1638.StbPin | tm1638.ClkPin | tm1638.DataPin);
	Set(tm1638.StbPin);
	Set(tm1638.ClkPin);
	writeCmd(0x40); // Send cmd write data
	writeCmd(0x80|(tm1638.active ? 8 : 0)|tm1638.intensity); //display active and brightness = 4
	Reset(tm1638.StbPin);
	writeByte(0xC0);
	for(i = 0; i < 16; i++)
		writeByte(0x00);
	Set(tm1638.StbPin);
}

static void writeByte(uint8_t byte)
{
	uint8_t i = 0;
	for(i = 0; i < 8; i++)
	{
		Reset(tm1638.ClkPin); //input Data at rising edge of the clock
		if(byte&0x01) Set(tm1638.DataPin);
		else Reset(tm1638.DataPin);
		Set(tm1638.ClkPin);
		byte>=1;
	}
}

static uint8_t readByte(void)
{
	uint8_t i = 0;
	uint8_t temp = 0x00;
	for(i = 0; i < 8; i++)
	{
		temp>>=1;
		Set(tm1638.ClkPin); //Output Data at falling edge of the clock
		if(Get(tm1638.DataPin)) temp |= 0x80;
		Reset(tm1638.ClkPin);
	}
	return temp;
}

static void writeCmd(uint8_t cmd)
{
	Set(tm1638.StbPin);
	Reset(tm1638.StbPin);  // falling edge STB is an instruction
	writeByte(cmd);
}

static void writeData(uint8_t addr, uint8_t data)
{
	writeCmd(0x44); //Setting Data (B7B6: 01): Normal Mode, Fixed addr, Write data
	writeCmd(0xC0|addr); //Setting Address (B7B6: 11): Display addr: 00H-0FH
	writeByte(data); // Send Data
}

void sendChar(uint8_t pos, uint8_t data, bool dot)
{
	writeData(pos << 1, data | (dot ? 0x80: 0x00));
}

void configDisplay(bool active, uint8_t intensity)
{
	tm1638.intensity = intensity;
	tm1638.active = active;
	writeCmd(0x80|(tm1638.active ? 8 : 0)| tm1638.intensity); //Display control (B7B6: 10): B3: 1: enable, 0: disable; B2B1B0: 0-7: brighness
	Reset(tm1638.StbPin);
  	Reset(tm1638.ClkPin);
  	Set(tm1638.ClkPin);
	Set(tm1638.StbPin);
}

void setDisplayDigit(uint8_t digit, uint8_t pos, bool dot, const uint8_t numberFont[])
{
	sendChar(pos, numberFont[digit & 0xF], dot);
}

void clearDisplayDigit(uint8_t pos, bool dot)
{
  sendChar(pos, 0, dot);
}

void setDisplay(const uint8_t values[], uint8_t size)
{
	uint8_t i = 0;
  	for(i = 0; i<size; i++) 
    	sendChar(i, values[i], 0);
}

void clearDisplay(void)
{
	uint8_t i = 0;
  	for(i = 0; i < 8; i++)
    	writeData(i << 1, 0);
}

void displayNumber(uint8_t pos, uint8_t number, bool dot)
{
	setDisplayDigit(number, pos, dot, NUMBER_FONT);
}

void setLed(uint8_t color, uint8_t pos)
{
	writeData((pos<<1)+1, color);
}



uint8_t getKey(void)
{
	uint8_t i;
	uint8_t key1 =  0x00;
	uint16_t key2 = 0x00;
	writeCmd(0x42);
	Set(tm1638.DataPin);
	for(i = 0; i < 4; i++)
	{
		key1 = readByte();
		key2|= (key1<<i);
	}
	key2>>=1;
	for(i = 0; i < 8; i++)
	{
		if(0x01<<i ==key2) return i+1;
	}
	return 0;
}

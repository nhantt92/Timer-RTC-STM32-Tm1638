EESchema Schematic File Version 2
LIBS:power
LIBS:device
LIBS:transistors
LIBS:conn
LIBS:linear
LIBS:regul
LIBS:74xx
LIBS:cmos4000
LIBS:adc-dac
LIBS:memory
LIBS:xilinx
LIBS:microcontrollers
LIBS:dsp
LIBS:microchip
LIBS:analog_switches
LIBS:motorola
LIBS:texas
LIBS:intel
LIBS:audio
LIBS:interface
LIBS:digital-audio
LIBS:philips
LIBS:display
LIBS:cypress
LIBS:siliconi
LIBS:opto
LIBS:atmel
LIBS:contrib
LIBS:valves
LIBS:nhantt-kicad-lib
LIBS:control-board-hw-cache
EELAYER 25 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title "STM32F103C8T6-MCU-Sheet"
Date "2017-08-17"
Rev "nhantt"
Comp "nhantt"
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L R R12
U 1 1 5986720C
P 4750 2150
F 0 "R12" V 4830 2150 50  0000 C CNN
F 1 "10k" V 4750 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4680 2150 50  0001 C CNN
F 3 "" H 4750 2150 50  0001 C CNN
	1    4750 2150
	1    0    0    -1  
$EndComp
$Comp
L C C25
U 1 1 598683B5
P 4750 2550
F 0 "C25" H 4775 2650 50  0000 L CNN
F 1 "100nF" H 4775 2450 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4788 2400 50  0001 C CNN
F 3 "" H 4750 2550 50  0001 C CNN
	1    4750 2550
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR015
U 1 1 5986AEFF
P 4750 2800
F 0 "#PWR015" H 4750 2550 50  0001 C CNN
F 1 "GND" H 4750 2650 50  0000 C CNN
F 2 "" H 4750 2800 50  0001 C CNN
F 3 "" H 4750 2800 50  0001 C CNN
	1    4750 2800
	1    0    0    -1  
$EndComp
$Comp
L CONN_01X04 J3
U 1 1 5986FE51
P 4500 5850
F 0 "J3" H 4500 6100 50  0000 C CNN
F 1 "CONN_01X04" V 4600 5850 50  0000 C CNN
F 2 "nhantt-kicad-lib:Pin_Header_Straight_1x04_Pitch2.54mm" H 4500 5850 50  0001 C CNN
F 3 "" H 4500 5850 50  0001 C CNN
	1    4500 5850
	-1   0    0    1   
$EndComp
Text Label 5000 5700 2    60   ~ 0
SWCLK
$Comp
L GND #PWR016
U 1 1 5987074F
P 5000 5900
F 0 "#PWR016" H 5000 5650 50  0001 C CNN
F 1 "GND" H 5000 5750 50  0000 C CNN
F 2 "" H 5000 5900 50  0001 C CNN
F 3 "" H 5000 5900 50  0001 C CNN
	1    5000 5900
	0    -1   -1   0   
$EndComp
Text Label 5000 5800 2    60   ~ 0
SWDIO
$Comp
L Crystal Y1
U 1 1 59874676
P 5800 7000
F 0 "Y1" H 5800 7150 50  0000 C CNN
F 1 "Crystal" H 5800 6850 50  0000 C CNN
F 2 "nhantt-kicad-lib:Crystal_SMD_HC49-SD" H 5800 7000 50  0001 C CNN
F 3 "" H 5800 7000 50  0001 C CNN
	1    5800 7000
	0    -1   -1   0   
$EndComp
$Comp
L C C1
U 1 1 59874FF7
P 6150 6750
F 0 "C1" H 6175 6850 50  0000 L CNN
F 1 "22pF" H 6175 6650 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6188 6600 50  0001 C CNN
F 3 "" H 6150 6750 50  0001 C CNN
	1    6150 6750
	0    -1   -1   0   
$EndComp
$Comp
L C C6
U 1 1 59875465
P 6150 7250
F 0 "C6" H 6175 7350 50  0000 L CNN
F 1 "22pF" H 6175 7150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 6188 7100 50  0001 C CNN
F 3 "" H 6150 7250 50  0001 C CNN
	1    6150 7250
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR017
U 1 1 59876527
P 6550 7250
F 0 "#PWR017" H 6550 7000 50  0001 C CNN
F 1 "GND" H 6550 7100 50  0000 C CNN
F 2 "" H 6550 7250 50  0001 C CNN
F 3 "" H 6550 7250 50  0001 C CNN
	1    6550 7250
	1    0    0    -1  
$EndComp
Text Label 5550 7250 0    60   ~ 0
OSCI
Text Label 5550 6750 0    60   ~ 0
OSCO
$Comp
L GND #PWR018
U 1 1 59894518
P 4600 1350
F 0 "#PWR018" H 4600 1100 50  0001 C CNN
F 1 "GND" H 4600 1200 50  0000 C CNN
F 2 "" H 4600 1350 50  0001 C CNN
F 3 "" H 4600 1350 50  0001 C CNN
	1    4600 1350
	1    0    0    -1  
$EndComp
$Comp
L C C14
U 1 1 59895E7B
P 4600 1150
F 0 "C14" H 4625 1250 50  0000 L CNN
F 1 "100nF" H 4625 1050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4638 1000 50  0001 C CNN
F 3 "" H 4600 1150 50  0001 C CNN
	1    4600 1150
	1    0    0    -1  
$EndComp
$Comp
L C C13
U 1 1 59897AC5
P 4300 1150
F 0 "C13" H 4325 1250 50  0000 L CNN
F 1 "10uF" H 4325 1050 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 4338 1000 50  0001 C CNN
F 3 "" H 4300 1150 50  0001 C CNN
	1    4300 1150
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR019
U 1 1 59897E0D
P 4300 1350
F 0 "#PWR019" H 4300 1100 50  0001 C CNN
F 1 "GND" H 4300 1200 50  0000 C CNN
F 2 "" H 4300 1350 50  0001 C CNN
F 3 "" H 4300 1350 50  0001 C CNN
	1    4300 1350
	1    0    0    -1  
$EndComp
$Comp
L STM32F103C8 U4
U 1 1 598B0833
P 6700 3750
F 0 "U4" H 5400 5400 50  0000 C CNN
F 1 "STM32F103C8" H 7750 2100 50  0000 C CNN
F 2 "nhantt-kicad-lib:LQFP-48_7x7mm_Pitch0.5mm" H 6700 3750 50  0001 C CNN
F 3 "" H 6700 3750 50  0000 C CNN
	1    6700 3750
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR020
U 1 1 598B8416
P 4600 950
F 0 "#PWR020" H 4600 800 50  0001 C CNN
F 1 "+3V3" H 4600 1090 50  0000 C CNN
F 2 "" H 4600 950 50  0001 C CNN
F 3 "" H 4600 950 50  0001 C CNN
	1    4600 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR021
U 1 1 598B8E61
P 4300 950
F 0 "#PWR021" H 4300 800 50  0001 C CNN
F 1 "+3V3" H 4300 1090 50  0000 C CNN
F 2 "" H 4300 950 50  0001 C CNN
F 3 "" H 4300 950 50  0001 C CNN
	1    4300 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR022
U 1 1 598B99E9
P 6600 1950
F 0 "#PWR022" H 6600 1800 50  0001 C CNN
F 1 "+3V3" H 6600 2090 50  0000 C CNN
F 2 "" H 6600 1950 50  0001 C CNN
F 3 "" H 6600 1950 50  0001 C CNN
	1    6600 1950
	1    0    0    -1  
$EndComp
Text Label 5000 2750 0    60   ~ 0
OSCI
Text Label 5000 2850 0    60   ~ 0
OSCO
Text Label 4850 3450 0    60   ~ 0
OSC32O
Text Label 4850 3350 0    60   ~ 0
OSC32I
$Comp
L C C15
U 1 1 598CB014
P 4850 1150
F 0 "C15" H 4875 1250 50  0000 L CNN
F 1 "100nF" H 4875 1050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4888 1000 50  0001 C CNN
F 3 "" H 4850 1150 50  0001 C CNN
	1    4850 1150
	1    0    0    -1  
$EndComp
$Comp
L C C16
U 1 1 598CB56A
P 5100 1150
F 0 "C16" H 5125 1250 50  0000 L CNN
F 1 "100nF" H 5125 1050 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 5138 1000 50  0001 C CNN
F 3 "" H 5100 1150 50  0001 C CNN
	1    5100 1150
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR023
U 1 1 598CD13C
P 4850 950
F 0 "#PWR023" H 4850 800 50  0001 C CNN
F 1 "+3V3" H 4850 1090 50  0000 C CNN
F 2 "" H 4850 950 50  0001 C CNN
F 3 "" H 4850 950 50  0001 C CNN
	1    4850 950 
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR024
U 1 1 598CD213
P 5100 950
F 0 "#PWR024" H 5100 800 50  0001 C CNN
F 1 "+3V3" H 5100 1090 50  0000 C CNN
F 2 "" H 5100 950 50  0001 C CNN
F 3 "" H 5100 950 50  0001 C CNN
	1    5100 950 
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR025
U 1 1 598CD2EA
P 4850 1350
F 0 "#PWR025" H 4850 1100 50  0001 C CNN
F 1 "GND" H 4850 1200 50  0000 C CNN
F 2 "" H 4850 1350 50  0001 C CNN
F 3 "" H 4850 1350 50  0001 C CNN
	1    4850 1350
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR026
U 1 1 598CD3C1
P 5100 1350
F 0 "#PWR026" H 5100 1100 50  0001 C CNN
F 1 "GND" H 5100 1200 50  0000 C CNN
F 2 "" H 5100 1350 50  0001 C CNN
F 3 "" H 5100 1350 50  0001 C CNN
	1    5100 1350
	1    0    0    -1  
$EndComp
$Comp
L L_Small L2
U 1 1 598CF3B6
P 7000 1550
F 0 "L2" H 7030 1590 50  0000 L CNN
F 1 "L_Small" H 7030 1510 50  0000 L CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" H 7000 1550 50  0001 C CNN
F 3 "" H 7000 1550 50  0001 C CNN
	1    7000 1550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR027
U 1 1 598D01C6
P 7000 1350
F 0 "#PWR027" H 7000 1200 50  0001 C CNN
F 1 "+3V3" H 7000 1490 50  0000 C CNN
F 2 "" H 7000 1350 50  0001 C CNN
F 3 "" H 7000 1350 50  0001 C CNN
	1    7000 1350
	1    0    0    -1  
$EndComp
$Comp
L C C18
U 1 1 598D1364
P 7250 1800
F 0 "C18" H 7275 1900 50  0000 L CNN
F 1 "100nF" H 7275 1700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 7288 1650 50  0001 C CNN
F 3 "" H 7250 1800 50  0001 C CNN
	1    7250 1800
	0    1    1    0   
$EndComp
$Comp
L GND #PWR028
U 1 1 598D2171
P 7500 1800
F 0 "#PWR028" H 7500 1550 50  0001 C CNN
F 1 "GND" H 7500 1650 50  0000 C CNN
F 2 "" H 7500 1800 50  0001 C CNN
F 3 "" H 7500 1800 50  0001 C CNN
	1    7500 1800
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR029
U 1 1 598D414E
P 6700 5550
F 0 "#PWR029" H 6700 5300 50  0001 C CNN
F 1 "GND" H 6700 5400 50  0000 C CNN
F 2 "" H 6700 5550 50  0001 C CNN
F 3 "" H 6700 5550 50  0001 C CNN
	1    6700 5550
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR030
U 1 1 598CF31B
P 4750 1950
F 0 "#PWR030" H 4750 1800 50  0001 C CNN
F 1 "+3V3" H 4750 2090 50  0000 C CNN
F 2 "" H 4750 1950 50  0001 C CNN
F 3 "" H 4750 1950 50  0001 C CNN
	1    4750 1950
	1    0    0    -1  
$EndComp
Text Label 8550 3750 2    60   ~ 0
SWDIO
Text Label 8550 3850 2    60   ~ 0
SWCLK
$Comp
L +3V3 #PWR031
U 1 1 59897E38
P 4900 6000
F 0 "#PWR031" H 4900 5850 50  0001 C CNN
F 1 "+3V3" H 4900 6140 50  0000 C CNN
F 2 "" H 4900 6000 50  0001 C CNN
F 3 "" H 4900 6000 50  0001 C CNN
	1    4900 6000
	0    1    1    0   
$EndComp
$Comp
L Crystal_GND3 Y2
U 1 1 5997C3CE
P 4950 7000
F 0 "Y2" H 4950 7225 50  0000 C CNN
F 1 "Crystal_GND3" H 4950 7150 50  0000 C CNN
F 2 "nhantt-kicad-lib:Crystal_Round_Horizontal_3mm_smd" H 4950 7000 50  0001 C CNN
F 3 "" H 4950 7000 50  0001 C CNN
	1    4950 7000
	0    1    1    0   
$EndComp
Text Label 5350 6800 2    60   ~ 0
OSC32O
Text Label 5350 7200 2    60   ~ 0
OSC32I
$Comp
L C C10
U 1 1 5997D899
P 4600 6800
F 0 "C10" H 4625 6900 50  0000 L CNN
F 1 "22pF" H 4625 6700 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4638 6650 50  0001 C CNN
F 3 "" H 4600 6800 50  0001 C CNN
	1    4600 6800
	0    -1   -1   0   
$EndComp
$Comp
L C C11
U 1 1 5997DA91
P 4600 7200
F 0 "C11" H 4625 7300 50  0000 L CNN
F 1 "22pF" H 4625 7100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4638 7050 50  0001 C CNN
F 3 "" H 4600 7200 50  0001 C CNN
	1    4600 7200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR032
U 1 1 5997DB22
P 4300 7250
F 0 "#PWR032" H 4300 7000 50  0001 C CNN
F 1 "GND" H 4300 7100 50  0000 C CNN
F 2 "" H 4300 7250 50  0001 C CNN
F 3 "" H 4300 7250 50  0001 C CNN
	1    4300 7250
	1    0    0    -1  
$EndComp
$Comp
L Battery_Cell BT1
U 1 1 59980DFC
P 4100 3300
F 0 "BT1" H 4200 3400 50  0000 L CNN
F 1 "Battery_Cell" V 3950 3200 50  0000 L CNN
F 2 "nhantt-kicad-lib:BT3V3" V 4100 3360 50  0001 C CNN
F 3 "" V 4100 3360 50  0001 C CNN
	1    4100 3300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR033
U 1 1 599810DD
P 4100 3450
F 0 "#PWR033" H 4100 3200 50  0001 C CNN
F 1 "GND" H 4100 3300 50  0000 C CNN
F 2 "" H 4100 3450 50  0001 C CNN
F 3 "" H 4100 3450 50  0001 C CNN
	1    4100 3450
	1    0    0    -1  
$EndComp
$Comp
L C C4
U 1 1 599834A4
P 4450 3250
F 0 "C4" H 4475 3350 50  0000 L CNN
F 1 "100nF" H 4475 3150 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 4488 3100 50  0001 C CNN
F 3 "" H 4450 3250 50  0001 C CNN
	1    4450 3250
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR034
U 1 1 59983BC1
P 4450 3400
F 0 "#PWR034" H 4450 3150 50  0001 C CNN
F 1 "GND" H 4450 3250 50  0000 C CNN
F 2 "" H 4450 3400 50  0001 C CNN
F 3 "" H 4450 3400 50  0001 C CNN
	1    4450 3400
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR035
U 1 1 59A6D867
P 2250 1150
F 0 "#PWR035" H 2250 1000 50  0001 C CNN
F 1 "+3V3" H 2250 1290 50  0000 C CNN
F 2 "" H 2250 1150 50  0001 C CNN
F 3 "" H 2250 1150 50  0001 C CNN
	1    2250 1150
	1    0    0    -1  
$EndComp
$Comp
L L_Small L1
U 1 1 59A6F157
P 2250 1450
F 0 "L1" H 2280 1490 50  0000 L CNN
F 1 "L_Small" H 2280 1410 50  0000 L CNN
F 2 "Resistors_SMD:R_1210_HandSoldering" H 2250 1450 50  0001 C CNN
F 3 "" H 2250 1450 50  0001 C CNN
	1    2250 1450
	1    0    0    1   
$EndComp
$Comp
L C C3
U 1 1 59A7148C
P 2450 1850
F 0 "C3" H 2475 1950 50  0000 L CNN
F 1 "100nF" H 2300 2000 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 1700 50  0001 C CNN
F 3 "" H 2450 1850 50  0001 C CNN
	1    2450 1850
	0    1    1    0   
$EndComp
$Comp
L GND #PWR036
U 1 1 59A729F0
P 2650 1850
F 0 "#PWR036" H 2650 1600 50  0001 C CNN
F 1 "GND" H 2650 1700 50  0000 C CNN
F 2 "" H 2650 1850 50  0001 C CNN
F 3 "" H 2650 1850 50  0001 C CNN
	1    2650 1850
	0    -1   -1   0   
$EndComp
$Comp
L C C2
U 1 1 59A72CDF
P 2450 1200
F 0 "C2" H 2475 1300 50  0000 L CNN
F 1 "100nF" H 2475 1100 50  0000 L CNN
F 2 "Capacitors_SMD:C_0805_HandSoldering" H 2488 1050 50  0001 C CNN
F 3 "" H 2450 1200 50  0001 C CNN
	1    2450 1200
	0    -1   -1   0   
$EndComp
$Comp
L GND #PWR037
U 1 1 59A732A3
P 2650 1200
F 0 "#PWR037" H 2650 950 50  0001 C CNN
F 1 "GND" H 2650 1050 50  0000 C CNN
F 2 "" H 2650 1200 50  0001 C CNN
F 3 "" H 2650 1200 50  0001 C CNN
	1    2650 1200
	0    -1   -1   0   
$EndComp
Text Label 2800 2550 2    60   ~ 0
key6
Text Label 2800 2450 2    60   ~ 0
key5
Text Label 2800 2350 2    60   ~ 0
key4
Text Label 2800 2250 2    60   ~ 0
key3
Text Label 2800 2150 2    60   ~ 0
key2
Text Label 2800 2050 2    60   ~ 0
key1
$Comp
L R R11
U 1 1 59A8E38C
P 750 3000
F 0 "R11" V 830 3000 50  0000 C CNN
F 1 "4.7k" V 750 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 680 3000 50  0001 C CNN
F 3 "" H 750 3000 50  0001 C CNN
	1    750  3000
	1    0    0    -1  
$EndComp
$Comp
L R R13
U 1 1 59A8F601
P 950 3000
F 0 "R13" V 1030 3000 50  0000 C CNN
F 1 "4.7k" V 950 3000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 880 3000 50  0001 C CNN
F 3 "" H 950 3000 50  0001 C CNN
	1    950  3000
	1    0    0    -1  
$EndComp
$Comp
L +3V3 #PWR038
U 1 1 59A8FCC7
P 850 2800
F 0 "#PWR038" H 850 2650 50  0001 C CNN
F 1 "+3V3" H 850 2940 50  0000 C CNN
F 2 "" H 850 2800 50  0001 C CNN
F 3 "" H 850 2800 50  0001 C CNN
	1    850  2800
	1    0    0    -1  
$EndComp
Text Label 1250 2550 0    60   ~ 0
LCD_SCL
Text Label 1250 2450 0    60   ~ 0
LCD_SDA
Text Label 4850 4650 0    60   ~ 0
LCD_SCL
Text Label 4850 4750 0    60   ~ 0
LCD_SDA
Text Label 4750 4250 0    60   ~ 0
SCL2
Text Label 4750 4350 0    60   ~ 0
SDA2
Text Label 8600 3350 2    60   ~ 0
TX
Text Label 8600 3450 2    60   ~ 0
RX
Text Label 8600 2650 2    60   ~ 0
TX_485
Text Label 8600 2750 2    60   ~ 0
RX_485
Text Label 4850 3650 0    60   ~ 0
key1
Text Label 4850 3750 0    60   ~ 0
key2
Text Label 4850 3850 0    60   ~ 0
key3
Text Label 4850 4150 0    60   ~ 0
key4
Text Label 4850 4050 0    60   ~ 0
key5
Text Label 4850 3950 0    60   ~ 0
key6
$Comp
L R R1
U 1 1 59AF6627
P 2350 2050
F 0 "R1" V 2430 2050 50  0000 C CNN
F 1 "0R" V 2350 2050 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2050 50  0001 C CNN
F 3 "" H 2350 2050 50  0001 C CNN
	1    2350 2050
	0    1    1    0   
$EndComp
$Comp
L R R2
U 1 1 59AF6B2F
P 2350 2150
F 0 "R2" V 2430 2150 50  0000 C CNN
F 1 "0R" V 2350 2150 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2150 50  0001 C CNN
F 3 "" H 2350 2150 50  0001 C CNN
	1    2350 2150
	0    1    1    0   
$EndComp
$Comp
L R R3
U 1 1 59AF6BA3
P 2350 2250
F 0 "R3" V 2430 2250 50  0000 C CNN
F 1 "0R" V 2350 2250 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2250 50  0001 C CNN
F 3 "" H 2350 2250 50  0001 C CNN
	1    2350 2250
	0    1    1    0   
$EndComp
$Comp
L R R4
U 1 1 59AF6C16
P 2350 2350
F 0 "R4" V 2430 2350 50  0000 C CNN
F 1 "0R" V 2350 2350 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2350 50  0001 C CNN
F 3 "" H 2350 2350 50  0001 C CNN
	1    2350 2350
	0    1    1    0   
$EndComp
$Comp
L R R5
U 1 1 59AF6C8C
P 2350 2450
F 0 "R5" V 2430 2450 50  0000 C CNN
F 1 "0R" V 2350 2450 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2450 50  0001 C CNN
F 3 "" H 2350 2450 50  0001 C CNN
	1    2350 2450
	0    1    1    0   
$EndComp
$Comp
L R R6
U 1 1 59AF6E86
P 2350 2550
F 0 "R6" V 2430 2550 50  0000 C CNN
F 1 "0R" V 2350 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 2280 2550 50  0001 C CNN
F 3 "" H 2350 2550 50  0001 C CNN
	1    2350 2550
	0    1    1    0   
$EndComp
Text Label 8600 2850 2    60   ~ 0
CS
Text Label 8600 2950 2    60   ~ 0
SCK
Text Label 8600 3050 2    60   ~ 0
MISO
Text Label 8600 3150 2    60   ~ 0
MOSI
Text Label 8600 2450 2    60   ~ 0
RST
Text Label 8600 2550 2    60   ~ 0
spray_ctrl
Text Label 8600 3250 2    60   ~ 0
pump1
Text Label 4850 5150 0    60   ~ 0
valve
Text Label 4850 5050 0    60   ~ 0
oxi
Text Label 4850 4950 0    60   ~ 0
ext_out1
Text Label 4850 4850 0    60   ~ 0
ext_out2
Text Label 4850 4550 0    60   ~ 0
WATER_H
Text Label 8650 3950 2    60   ~ 0
WATER_M
Text HLabel 10400 1000 2    60   Output ~ 0
spray_ctrl
Text HLabel 10400 1150 2    60   Output ~ 0
pump1
Text HLabel 10400 1300 2    60   Output ~ 0
valve
Text HLabel 10400 1450 2    60   Output ~ 0
oxi
Text HLabel 10400 1600 2    60   Output ~ 0
ext_out1
Text HLabel 10400 1750 2    60   Output ~ 0
ext_out2
Text HLabel 10400 2150 2    60   Output ~ 0
TX
Text HLabel 10400 2300 2    60   Input ~ 0
RX
Text HLabel 10400 2500 2    60   Output ~ 0
TX_485
Text HLabel 10400 2650 2    60   Input ~ 0
RX_485
Text HLabel 10400 2850 2    60   Input ~ 0
WATER_H
Text HLabel 10400 3000 2    60   Input ~ 0
WATER_M
Text HLabel 10400 3150 2    60   Input ~ 0
WATER_L
Text HLabel 10450 3350 2    60   Output ~ 0
SCL2
Text HLabel 10450 3500 2    60   Input ~ 0
SDA2
Text Label 9800 1000 0    60   ~ 0
spray_ctrl
Text Label 9800 1150 0    60   ~ 0
pump1
Text Label 9800 1300 0    60   ~ 0
valve
Text Label 9800 1450 0    60   ~ 0
oxi
Text Label 9800 1600 0    60   ~ 0
ext_out1
Text Label 9800 1750 0    60   ~ 0
ext_out2
Text Label 9800 2150 0    60   ~ 0
TX
Text Label 9800 2300 0    60   ~ 0
RX
Text Label 9800 2500 0    60   ~ 0
TX_485
Text Label 9800 2650 0    60   ~ 0
RX_485
Text Label 9800 2850 0    60   ~ 0
WATER_H
Text Label 9800 3000 0    60   ~ 0
WATER_M
Text Label 9800 3150 0    60   ~ 0
WATER_L
Text Label 9800 3350 0    60   ~ 0
SCL2
Text Label 9800 3500 0    60   ~ 0
SDA_2
Text Label 8600 3550 2    60   ~ 0
usb_dm
Text Label 8600 3650 2    60   ~ 0
usb_dp
Text Label 4850 4450 0    60   ~ 0
WATER_L
$Comp
L USB_OTG J7
U 1 1 5998FAF4
P 10650 4900
F 0 "J7" H 10450 5350 50  0000 L CNN
F 1 "USB_OTG" H 10450 5250 50  0000 L CNN
F 2 "nhantt-kicad-lib:USB_Micro-B" H 10800 4850 50  0001 C CNN
F 3 "" H 10800 4850 50  0001 C CNN
	1    10650 4900
	-1   0    0    -1  
$EndComp
Text HLabel 9850 4600 0    60   Input ~ 0
+5V
$Comp
L D_ALT D13
U 1 1 59992725
P 10100 4700
F 0 "D13" H 10100 4800 50  0000 C CNN
F 1 "D_ALT" H 10100 4600 50  0000 C CNN
F 2 "nhantt-kicad-lib:D_SMA_Standard" H 10100 4700 50  0001 C CNN
F 3 "" H 10100 4700 50  0001 C CNN
	1    10100 4700
	1    0    0    -1  
$EndComp
$Comp
L R R9
U 1 1 599955AF
P 10100 5000
F 0 "R9" V 10180 5000 50  0000 C CNN
F 1 "22R" V 10100 5000 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10030 5000 50  0001 C CNN
F 3 "" H 10100 5000 50  0001 C CNN
	1    10100 5000
	0    1    1    0   
$EndComp
$Comp
L R R8
U 1 1 599969D1
P 10100 4900
F 0 "R8" V 10180 4900 50  0000 C CNN
F 1 "22R" V 10100 4900 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 10030 4900 50  0001 C CNN
F 3 "" H 10100 4900 50  0001 C CNN
	1    10100 4900
	0    1    1    0   
$EndComp
$Comp
L R R7
U 1 1 59996F72
P 9850 4800
F 0 "R7" V 9930 4800 50  0000 C CNN
F 1 "1.5k" V 9850 4800 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 9780 4800 50  0001 C CNN
F 3 "" H 9850 4800 50  0001 C CNN
	1    9850 4800
	0    1    1    0   
$EndComp
Text Label 9350 4800 0    60   ~ 0
usb_dis
Text Label 9350 4900 0    60   ~ 0
usb_dp
Text Label 9350 5000 0    60   ~ 0
usb_dm
NoConn ~ 10350 5100
$Comp
L GND #PWR039
U 1 1 5999CB40
P 10700 5400
F 0 "#PWR039" H 10700 5150 50  0001 C CNN
F 1 "GND" H 10700 5250 50  0000 C CNN
F 2 "" H 10700 5400 50  0001 C CNN
F 3 "" H 10700 5400 50  0001 C CNN
	1    10700 5400
	1    0    0    -1  
$EndComp
Text Label 4850 3250 0    60   ~ 0
usb_dis
Text Label 1250 1950 0    60   ~ 0
RST
Text Label 1250 2050 0    60   ~ 0
CS
Text Label 1250 2150 0    60   ~ 0
SCK
Text Label 1250 2250 0    60   ~ 0
MISO
Text Label 1250 2350 0    60   ~ 0
MOSI
Text Notes 550  2450 0    60   ~ 0
LCD_OLED_I2C
Text Notes 2900 2400 1    60   ~ 0
Touch_key
$Comp
L CONN_02X10 J1
U 1 1 59A050F4
P 1900 2300
F 0 "J1" H 1900 2850 50  0000 C CNN
F 1 "CONN_02X10" V 1900 2300 50  0000 C CNN
F 2 "nhantt-kicad-lib:Pin_Header_Straight_2x10_Pitch2.00mm" H 1900 1100 50  0001 C CNN
F 3 "" H 1900 1100 50  0001 C CNN
	1    1900 2300
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR040
U 1 1 59A10918
P 2200 2800
F 0 "#PWR040" H 2200 2550 50  0001 C CNN
F 1 "GND" H 2200 2650 50  0000 C CNN
F 2 "" H 2200 2800 50  0001 C CNN
F 3 "" H 2200 2800 50  0001 C CNN
	1    2200 2800
	1    0    0    -1  
$EndComp
$Comp
L GND #PWR041
U 1 1 59A13AD1
P 1550 2800
F 0 "#PWR041" H 1550 2550 50  0001 C CNN
F 1 "GND" H 1550 2650 50  0000 C CNN
F 2 "" H 1550 2800 50  0001 C CNN
F 3 "" H 1550 2800 50  0001 C CNN
	1    1550 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	4750 1950 4750 2000
Wire Wire Line
	4750 2350 5200 2350
Wire Wire Line
	4750 2300 4750 2400
Connection ~ 4750 2350
Wire Wire Line
	4750 2700 4750 2800
Wire Wire Line
	4700 5700 5000 5700
Wire Wire Line
	4700 5800 5000 5800
Wire Wire Line
	4700 5900 5000 5900
Wire Wire Line
	4900 6000 4700 6000
Wire Wire Line
	5550 6750 6000 6750
Wire Wire Line
	5800 6750 5800 6850
Wire Wire Line
	5550 7250 6000 7250
Wire Wire Line
	5800 7250 5800 7150
Wire Wire Line
	6300 6750 6400 6750
Wire Wire Line
	6400 6750 6400 7250
Wire Wire Line
	6400 7250 6300 7250
Wire Wire Line
	6550 7250 6550 7000
Wire Wire Line
	6550 7000 6400 7000
Connection ~ 6400 7000
Connection ~ 5800 6750
Connection ~ 5800 7250
Wire Wire Line
	4600 1000 4600 950 
Wire Wire Line
	4600 1350 4600 1300
Wire Wire Line
	4300 1350 4300 1300
Wire Wire Line
	4300 950  4300 1000
Wire Wire Line
	6500 2050 6500 2000
Wire Wire Line
	6400 2000 6700 2000
Wire Wire Line
	6600 2000 6600 1950
Wire Wire Line
	6700 2000 6700 2050
Connection ~ 6600 2000
Wire Wire Line
	6400 2050 6400 2000
Connection ~ 6500 2000
Connection ~ 4750 2750
Wire Wire Line
	5200 2750 5000 2750
Wire Wire Line
	5200 2850 5000 2850
Wire Wire Line
	4850 3450 5200 3450
Wire Wire Line
	4850 3350 5200 3350
Wire Wire Line
	4850 1000 4850 950 
Wire Wire Line
	5100 1000 5100 950 
Wire Wire Line
	5100 1350 5100 1300
Wire Wire Line
	4850 1350 4850 1300
Wire Wire Line
	7000 1450 7000 1350
Wire Wire Line
	7000 1650 7000 2050
Wire Wire Line
	7100 1800 7000 1800
Connection ~ 7000 1800
Wire Wire Line
	7500 1800 7400 1800
Wire Wire Line
	6400 5450 6400 5500
Wire Wire Line
	6400 5500 7000 5500
Wire Wire Line
	7000 5500 7000 5450
Wire Wire Line
	6700 5450 6700 5550
Connection ~ 6700 5500
Wire Wire Line
	6500 5450 6500 5500
Connection ~ 6500 5500
Wire Wire Line
	8200 2550 8600 2550
Wire Wire Line
	8200 2650 8600 2650
Wire Wire Line
	8200 2750 8600 2750
Wire Wire Line
	8200 2850 8600 2850
Wire Wire Line
	8200 2950 8600 2950
Wire Wire Line
	8200 3050 8600 3050
Wire Wire Line
	5200 3650 4850 3650
Wire Wire Line
	5200 3750 4850 3750
Wire Wire Line
	5200 3850 4850 3850
Wire Wire Line
	5200 3950 4850 3950
Wire Wire Line
	5200 4050 4850 4050
Wire Wire Line
	5200 4150 4850 4150
Wire Wire Line
	4750 4250 5200 4250
Wire Wire Line
	4750 4350 5200 4350
Wire Wire Line
	5200 4450 4850 4450
Wire Wire Line
	5200 4550 4850 4550
Wire Wire Line
	5200 4650 4850 4650
Wire Wire Line
	5200 4850 4850 4850
Wire Wire Line
	5200 4950 4850 4950
Wire Wire Line
	8200 3150 8600 3150
Wire Wire Line
	8200 3350 8600 3350
Wire Wire Line
	8200 3750 8550 3750
Wire Wire Line
	8200 3850 8550 3850
Wire Wire Line
	8200 3250 8600 3250
Wire Wire Line
	8200 2450 8600 2450
Wire Wire Line
	8200 3450 8600 3450
Wire Wire Line
	8200 3550 8600 3550
Wire Wire Line
	8200 3650 8600 3650
Wire Wire Line
	4750 7200 5350 7200
Wire Wire Line
	4950 7200 4950 7150
Wire Wire Line
	4950 6850 4950 6800
Wire Wire Line
	4750 6800 5350 6800
Wire Wire Line
	4300 7250 4300 7000
Wire Wire Line
	4300 7000 4750 7000
Wire Wire Line
	4450 6800 4400 6800
Wire Wire Line
	4400 6800 4400 7200
Connection ~ 4400 7000
Wire Wire Line
	4400 7200 4450 7200
Connection ~ 4950 6800
Connection ~ 4950 7200
Wire Wire Line
	4100 3050 5200 3050
Wire Wire Line
	4100 3050 4100 3100
Wire Wire Line
	4100 3450 4100 3400
Wire Wire Line
	4450 3100 4450 3050
Connection ~ 4450 3050
Wire Wire Line
	5200 4750 4850 4750
Wire Wire Line
	2250 1550 2250 1950
Wire Wire Line
	2150 1850 2300 1850
Wire Wire Line
	2250 1150 2250 1350
Wire Wire Line
	2300 1200 2250 1200
Connection ~ 2250 1200
Wire Wire Line
	2650 1200 2600 1200
Connection ~ 2250 1850
Wire Wire Line
	2600 1850 2650 1850
Wire Wire Line
	2500 2050 2800 2050
Wire Wire Line
	2500 2150 2800 2150
Wire Wire Line
	2500 2250 2800 2250
Wire Wire Line
	2500 2350 2800 2350
Wire Wire Line
	2500 2450 2800 2450
Wire Wire Line
	2500 2550 2800 2550
Wire Wire Line
	750  2850 950  2850
Wire Wire Line
	850  2800 850  2850
Connection ~ 850  2850
Wire Wire Line
	950  3300 950  3150
Wire Wire Line
	5200 3250 4850 3250
Wire Wire Line
	5200 5050 4850 5050
Wire Wire Line
	5200 5150 4850 5150
Wire Wire Line
	2200 2050 2150 2050
Wire Wire Line
	2200 2150 2150 2150
Wire Wire Line
	2200 2250 2150 2250
Wire Wire Line
	2200 2350 2150 2350
Wire Wire Line
	2200 2450 2150 2450
Wire Wire Line
	8200 3950 8650 3950
Wire Wire Line
	9800 1000 10400 1000
Wire Wire Line
	9800 1150 10400 1150
Wire Wire Line
	9800 1300 10400 1300
Wire Wire Line
	9800 1450 10400 1450
Wire Wire Line
	9800 1600 10400 1600
Wire Wire Line
	9800 1750 10400 1750
Wire Wire Line
	9800 2150 10400 2150
Wire Wire Line
	9800 2300 10400 2300
Wire Wire Line
	9800 2500 10400 2500
Wire Wire Line
	9800 2650 10400 2650
Wire Wire Line
	9800 2850 10400 2850
Wire Wire Line
	9800 3000 10400 3000
Wire Wire Line
	9800 3150 10400 3150
Wire Wire Line
	9800 3350 10450 3350
Wire Wire Line
	9800 3500 10450 3500
Wire Wire Line
	10350 4700 10250 4700
Wire Wire Line
	9950 4700 9900 4700
Wire Wire Line
	9900 4700 9900 4600
Wire Wire Line
	9900 4600 9850 4600
Wire Wire Line
	10250 4900 10350 4900
Wire Wire Line
	10350 5000 10250 5000
Wire Wire Line
	10000 4800 10300 4800
Wire Wire Line
	10300 4800 10300 4900
Connection ~ 10300 4900
Wire Wire Line
	9350 4800 9700 4800
Wire Wire Line
	9350 4900 9950 4900
Wire Wire Line
	9350 5000 9950 5000
Wire Wire Line
	10650 5300 10650 5350
Wire Wire Line
	10650 5350 10750 5350
Wire Wire Line
	10750 5350 10750 5300
Wire Wire Line
	10700 5400 10700 5350
Connection ~ 10700 5350
Wire Notes Line
	3150 800  3150 7700
Wire Notes Line
	500  5400 3150 5400
Wire Notes Line
	3150 5400 3150 5350
Wire Wire Line
	2250 1750 1600 1750
Wire Wire Line
	1600 1750 1600 1850
Wire Wire Line
	1600 1850 1650 1850
Connection ~ 2250 1750
Wire Wire Line
	1650 1950 1250 1950
Wire Wire Line
	1650 2050 1250 2050
Wire Wire Line
	1650 2150 1250 2150
Wire Wire Line
	1250 2250 1650 2250
Wire Wire Line
	1650 2350 1250 2350
Wire Wire Line
	1650 2450 1250 2450
Wire Wire Line
	1650 2550 1250 2550
Wire Wire Line
	1550 2650 1550 2800
Wire Wire Line
	1550 2750 1650 2750
Wire Wire Line
	2200 2650 2200 2800
Wire Wire Line
	2200 2750 2150 2750
$Comp
L R R10
U 1 1 59A172F1
P 5000 2550
F 0 "R10" V 5080 2550 50  0000 C CNN
F 1 "10k" V 5000 2550 50  0000 C CNN
F 2 "Resistors_SMD:R_0805_HandSoldering" V 4930 2550 50  0001 C CNN
F 3 "" H 5000 2550 50  0001 C CNN
	1    5000 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	5200 2550 5150 2550
Wire Wire Line
	4850 2550 4600 2550
Wire Wire Line
	4600 2550 4600 2750
Wire Wire Line
	4600 2750 4750 2750
Wire Wire Line
	1650 2650 1550 2650
Connection ~ 1550 2750
Wire Wire Line
	2150 2650 2200 2650
Connection ~ 2200 2750
Text Notes 700  1950 0    60   ~ 0
LCD_SPI
Wire Wire Line
	750  3200 1450 3200
Wire Wire Line
	750  3150 750  3200
Wire Wire Line
	950  3300 1450 3300
Text Label 1450 3200 2    60   ~ 0
LCD_SDA
Text Label 1450 3300 2    60   ~ 0
LCD_SCL
Wire Wire Line
	2250 1950 2150 1950
Wire Wire Line
	2200 2550 2150 2550
$Comp
L C C5
U 1 1 59A20F92
P 2450 1600
F 0 "C5" H 2475 1700 50  0000 L CNN
F 1 "10uF" H 2300 1750 50  0000 L CNN
F 2 "Capacitors_SMD:C_1206_HandSoldering" H 2488 1450 50  0001 C CNN
F 3 "" H 2450 1600 50  0001 C CNN
	1    2450 1600
	0    1    1    0   
$EndComp
Wire Wire Line
	2300 1600 2250 1600
Connection ~ 2250 1600
$Comp
L GND #PWR042
U 1 1 59A21C1E
P 2650 1600
F 0 "#PWR042" H 2650 1350 50  0001 C CNN
F 1 "GND" H 2650 1450 50  0000 C CNN
F 2 "" H 2650 1600 50  0001 C CNN
F 3 "" H 2650 1600 50  0001 C CNN
	1    2650 1600
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2650 1600 2600 1600
$EndSCHEMATC

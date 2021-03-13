EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector:USB_B_Micro J2
U 1 1 6067D3AF
P 3030 4030
F 0 "J2" H 3087 4497 50  0000 C CNN
F 1 "USB_B_Micro" H 3087 4406 50  0000 C CNN
F 2 "keyboard6:USB_mini_b_TE_ 1734035-2" H 3180 3980 50  0001 C CNN
F 3 "~" H 3180 3980 50  0001 C CNN
	1    3030 4030
	1    0    0    -1  
$EndComp
$Comp
L Device:C C3
U 1 1 606865AF
P 2360 3250
F 0 "C3" H 2475 3296 50  0000 L CNN
F 1 "0.1u" H 2475 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 2398 3100 50  0001 C CNN
F 3 "~" H 2360 3250 50  0001 C CNN
	1    2360 3250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C6
U 1 1 606867B0
P 4550 3780
F 0 "C6" H 4665 3826 50  0000 L CNN
F 1 "0.1u" H 4665 3735 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4588 3630 50  0001 C CNN
F 3 "~" H 4550 3780 50  0001 C CNN
	1    4550 3780
	1    0    0    -1  
$EndComp
$Comp
L Device:C C4
U 1 1 60686B4F
P 1630 3260
F 0 "C4" H 1745 3306 50  0000 L CNN
F 1 "10u" H 1745 3215 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1668 3110 50  0001 C CNN
F 3 "~" H 1630 3260 50  0001 C CNN
	1    1630 3260
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 60687B97
P 4990 2680
F 0 "R1" H 5060 2726 50  0000 L CNN
F 1 "4.7k" H 5060 2635 50  0000 L CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4920 2680 50  0001 C CNN
F 3 "~" H 4990 2680 50  0001 C CNN
	1    4990 2680
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 60688329
P 4120 4130
F 0 "R3" V 4210 4130 50  0000 C CNN
F 1 "22" V 4310 4130 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 4050 4130 50  0001 C CNN
F 3 "~" H 4120 4130 50  0001 C CNN
	1    4120 4130
	0    1    1    0   
$EndComp
$Comp
L Device:R R2
U 1 1 60688965
P 3940 4030
F 0 "R2" V 3733 4030 50  0000 C CNN
F 1 "22" V 3824 4030 50  0000 C CNN
F 2 "Resistor_SMD:R_0805_2012Metric_Pad1.20x1.40mm_HandSolder" V 3870 4030 50  0001 C CNN
F 3 "~" H 3940 4030 50  0001 C CNN
	1    3940 4030
	0    1    1    0   
$EndComp
Wire Wire Line
	7330 4430 7330 4060
Wire Wire Line
	4790 2880 4790 3030
Wire Wire Line
	4790 3080 4790 3030
Connection ~ 4790 3030
$Comp
L power:GND #PWR01
U 1 1 607155A7
P 2360 4720
F 0 "#PWR01" H 2360 4470 50  0001 C CNN
F 1 "GND" H 2365 4547 50  0000 C CNN
F 2 "" H 2360 4720 50  0001 C CNN
F 3 "" H 2360 4720 50  0001 C CNN
	1    2360 4720
	1    0    0    -1  
$EndComp
Wire Wire Line
	3030 4720 3030 4510
Wire Wire Line
	2360 4720 3030 4720
Text GLabel 2550 4720 3    50   Input ~ 0
GND1
Text GLabel 7130 4100 3    50   Input ~ 0
GND1
Text GLabel 3750 3350 0    50   Input ~ 0
GND1
Wire Wire Line
	4090 4030 5100 4030
Wire Wire Line
	6300 4430 7330 4430
Wire Wire Line
	4790 3030 4990 3030
Wire Wire Line
	5100 4130 4270 4130
Wire Wire Line
	3330 3830 3330 3020
Text GLabel 2820 2580 1    50   Input ~ 0
VBUS
Text GLabel 5090 3830 0    50   Input ~ 0
VBUS
Wire Wire Line
	5100 3830 5090 3830
Text GLabel 5700 2350 1    50   Input ~ 0
VBUS
Wire Wire Line
	5600 2730 5600 2660
Wire Wire Line
	5600 2660 5700 2660
Wire Wire Line
	5700 2660 5700 2730
Wire Wire Line
	5700 2660 5800 2660
Wire Wire Line
	5800 2660 5800 2730
Connection ~ 5700 2660
Wire Wire Line
	5700 2660 5700 2420
Text GLabel 7430 4100 3    50   Input ~ 0
VBUS
Wire Wire Line
	2820 2580 2820 2720
$Comp
L Device:Fuse F1
U 1 1 60840793
P 2820 2870
F 0 "F1" H 2880 2916 50  0000 L CNN
F 1 "500m" H 2880 2825 50  0000 L CNN
F 2 "Fuse:Fuse_0603_1608Metric" V 2750 2870 50  0001 C CNN
F 3 "~" H 2820 2870 50  0001 C CNN
	1    2820 2870
	1    0    0    -1  
$EndComp
Connection ~ 2820 3020
Wire Wire Line
	2820 3020 3330 3020
Wire Wire Line
	2360 4710 2360 3530
Wire Wire Line
	1960 3400 1960 3530
Wire Wire Line
	1960 3530 2360 3530
Connection ~ 2360 3530
Wire Wire Line
	2360 3530 2360 3400
Wire Wire Line
	2360 3020 2360 3100
Wire Wire Line
	2360 3020 1960 3020
Wire Wire Line
	1960 3020 1960 3100
Connection ~ 2360 3020
$Comp
L Device:C C2
U 1 1 60686208
P 1960 3250
F 0 "C2" H 2075 3296 50  0000 L CNN
F 1 "1u" H 2075 3205 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 1998 3100 50  0001 C CNN
F 3 "~" H 1960 3250 50  0001 C CNN
	1    1960 3250
	1    0    0    -1  
$EndComp
Wire Wire Line
	1960 3020 1630 3020
Wire Wire Line
	1630 3020 1630 3110
Connection ~ 1960 3020
Wire Wire Line
	1630 3410 1630 3530
Wire Wire Line
	1630 3530 1960 3530
Connection ~ 1960 3530
Wire Wire Line
	4990 2830 4990 3030
Connection ~ 4990 3030
Wire Wire Line
	4990 3030 5100 3030
Wire Wire Line
	4990 2530 4990 2420
Wire Wire Line
	4990 2420 5410 2420
Connection ~ 5700 2420
Wire Wire Line
	5700 2420 5700 2350
Text GLabel 4480 3930 0    50   Input ~ 0
GND1
Wire Wire Line
	4550 3630 5100 3630
$Comp
L Device:C C7
U 1 1 609349BE
P 4790 4480
F 0 "C7" H 4905 4526 50  0000 L CNN
F 1 "1u" H 4905 4435 50  0000 L CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4828 4330 50  0001 C CNN
F 3 "~" H 4790 4480 50  0001 C CNN
	1    4790 4480
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 4330 4790 4330
Text GLabel 4790 4630 0    50   Input ~ 0
GND1
Wire Wire Line
	4480 3930 4550 3930
Text GLabel 5470 6430 0    50   Input ~ 0
GND1
Wire Wire Line
	5600 6330 5600 6430
Wire Wire Line
	5700 6330 5700 6430
Wire Wire Line
	5700 6430 5600 6430
Connection ~ 5600 6430
Wire Wire Line
	5600 6430 5470 6430
$Comp
L Device:C C1
U 1 1 60983234
P 4030 3230
F 0 "C1" V 3870 3160 50  0000 C CNN
F 1 "16p" V 3870 3310 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4068 3080 50  0001 C CNN
F 3 "~" H 4030 3230 50  0001 C CNN
	1    4030 3230
	0    1    1    0   
$EndComp
$Comp
L Device:C C5
U 1 1 60984579
P 4030 3450
F 0 "C5" V 4180 3380 50  0000 C CNN
F 1 "16p" V 4180 3550 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric_Pad1.18x1.45mm_HandSolder" H 4068 3300 50  0001 C CNN
F 3 "~" H 4030 3450 50  0001 C CNN
	1    4030 3450
	0    1    1    0   
$EndComp
$Comp
L Device:Crystal_Small Y1
U 1 1 609AA1F0
P 4470 3330
F 0 "Y1" V 4424 3418 50  0000 L CNN
F 1 "16MHz" V 4515 3418 50  0000 L CNN
F 2 "keyboard6:Crystal_CSM-7X_SMD" H 4470 3330 50  0001 C CNN
F 3 "~" H 4470 3330 50  0001 C CNN
	1    4470 3330
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 3230 4470 3230
$Comp
L MCU_Microchip_ATmega:ATmega32U4-AU mcu1
U 1 1 6067BB5F
P 5700 4530
F 0 "mcu1" H 5870 2750 50  0000 C CNN
F 1 "ATmega32U4-AU" H 6090 2640 50  0000 C CNN
F 2 "Package_QFP:TQFP-44_10x10mm_P0.8mm" H 5700 4530 50  0001 C CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/Atmel-7766-8-bit-AVR-ATmega16U4-32U4_Datasheet.pdf" H 5700 4530 50  0001 C CNN
	1    5700 4530
	1    0    0    -1  
$EndComp
Wire Wire Line
	5100 3430 4470 3430
Wire Wire Line
	4470 3230 4180 3230
Connection ~ 4470 3230
Wire Wire Line
	4470 3430 4180 3430
Wire Wire Line
	4180 3430 4180 3450
Connection ~ 4470 3430
Wire Wire Line
	3880 3230 3820 3230
Wire Wire Line
	3820 3230 3820 3350
Wire Wire Line
	3820 3350 3750 3350
Wire Wire Line
	3820 3350 3820 3450
Wire Wire Line
	3820 3450 3880 3450
Connection ~ 3820 3350
NoConn ~ 3330 4230
NoConn ~ 7230 4060
Wire Wire Line
	6740 5130 6300 5130
Text HLabel 6470 5630 2    50   Input ~ 0
row3
Text HLabel 6470 5530 2    50   Input ~ 0
row4
Text HLabel 6470 5730 2    50   Input ~ 0
row2
Text HLabel 6470 5830 2    50   Input ~ 0
row1
Text HLabel 6470 5930 2    50   Input ~ 0
row0
Text HLabel 6470 5230 2    50   Output ~ 0
col5
Text HLabel 6470 3530 2    50   Output ~ 0
col4
Text HLabel 6470 3630 2    50   Output ~ 0
col3
Text HLabel 6470 3730 2    50   Output ~ 0
col2
Text HLabel 6470 4830 2    50   Output ~ 0
col1
Text HLabel 6470 4030 2    50   Output ~ 0
col0
Wire Wire Line
	6470 3530 6300 3530
Wire Wire Line
	6300 3630 6470 3630
Wire Wire Line
	6470 3730 6300 3730
Wire Wire Line
	6470 4030 6300 4030
Wire Wire Line
	6470 4830 6300 4830
Wire Wire Line
	6300 5230 6470 5230
Wire Wire Line
	6470 5530 6300 5530
Wire Wire Line
	6470 5630 6300 5630
Wire Wire Line
	6300 5730 6470 5730
Wire Wire Line
	6470 5830 6300 5830
Wire Wire Line
	6300 5930 6470 5930
NoConn ~ 6300 3030
NoConn ~ 6300 3130
NoConn ~ 6300 3230
NoConn ~ 6300 3330
NoConn ~ 6300 3430
NoConn ~ 6300 3930
NoConn ~ 6300 4230
NoConn ~ 6300 4330
NoConn ~ 6300 4530
NoConn ~ 6300 4630
NoConn ~ 6300 4730
NoConn ~ 6300 4930
NoConn ~ 6300 5430
Wire Wire Line
	2930 4430 2930 4510
Wire Wire Line
	2930 4510 3030 4510
Connection ~ 3030 4510
Wire Wire Line
	3030 4510 3030 4430
Text GLabel 6740 5130 2    50   Input ~ 0
GND1
Text Notes 6770 5050 0    50   ~ 0
HWB tied to ground means that the\nbootloader will be executed \n(assuming correct WHBE fuse value)
Wire Wire Line
	4730 3080 4790 3080
Wire Wire Line
	4730 2880 4790 2880
$Comp
L Switch:SW_Push_Dual SW30
U 1 1 6068AC98
P 4530 2880
F 0 "SW30" H 4530 3165 50  0000 C CNN
F 1 "SW_Push_Dual" H 4530 3074 50  0000 C CNN
F 2 "keyboard6:schurter sms gullwing lead" H 4530 3080 50  0001 C CNN
F 3 "~" H 4530 3080 50  0001 C CNN
	1    4530 2880
	1    0    0    -1  
$EndComp
Wire Wire Line
	4330 2880 4330 3080
Text GLabel 4330 2930 0    50   Input ~ 0
GND1
Wire Wire Line
	2360 3020 2820 3020
Wire Wire Line
	3330 4030 3790 4030
Wire Wire Line
	3330 4130 3970 4130
$Comp
L Connector:AudioJack4 J1
U 1 1 6068FFB3
P 7230 3860
F 0 "J1" V 7141 3530 50  0000 R CNN
F 1 "AudioJack4" V 7232 3530 50  0000 R CNN
F 2 "keyboard6:TRRS_smd_SparkFun_PRT-12639" H 7230 3860 50  0001 C CNN
F 3 "~" H 7230 3860 50  0001 C CNN
	1    7230 3860
	0    -1   1    0   
$EndComp
Wire Wire Line
	7130 4060 7130 4100
Wire Wire Line
	7430 4100 7430 4060
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 60C7D5DB
P 5410 2420
F 0 "#FLG0101" H 5410 2495 50  0001 C CNN
F 1 "PWR_FLAG" H 5410 2593 50  0000 C CNN
F 2 "" H 5410 2420 50  0001 C CNN
F 3 "~" H 5410 2420 50  0001 C CNN
	1    5410 2420
	1    0    0    -1  
$EndComp
Connection ~ 5410 2420
Wire Wire Line
	5410 2420 5700 2420
$EndSCHEMATC

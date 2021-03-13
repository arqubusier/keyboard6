EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
Connection ~ 9690 4670
Wire Wire Line
	2380 870  2380 1360
Wire Wire Line
	9690 870  2380 870 
Wire Wire Line
	9690 4670 9690 870 
Connection ~ 8990 6450
Connection ~ 7790 6450
Connection ~ 6500 6450
Wire Wire Line
	7790 5770 7790 5850
Wire Wire Line
	7690 5770 7790 5770
Wire Wire Line
	8990 5770 8990 5850
Wire Wire Line
	8890 5770 8990 5770
Connection ~ 8990 5360
Connection ~ 7790 5360
Connection ~ 6500 5360
Connection ~ 5290 5360
Connection ~ 7790 4260
Connection ~ 6500 4260
Connection ~ 5290 4260
Connection ~ 7790 3160
Connection ~ 6500 3160
Connection ~ 5290 3160
Connection ~ 7790 2060
Connection ~ 6500 2060
Connection ~ 5290 2060
Connection ~ 4090 2060
Wire Wire Line
	3590 3560 3590 4660
Connection ~ 3590 3560
Wire Wire Line
	3590 2460 3590 3560
Connection ~ 3590 2460
Wire Wire Line
	3590 1360 3590 2460
Wire Wire Line
	9690 4670 9690 5770
Wire Wire Line
	8490 4660 8490 5770
Connection ~ 8490 4660
Wire Wire Line
	8490 3560 8490 4660
Connection ~ 8490 3560
Wire Wire Line
	8490 2460 8490 3560
Connection ~ 8490 2460
Wire Wire Line
	8490 1360 8490 2460
Wire Wire Line
	7290 4660 7290 5770
Connection ~ 7290 4660
Wire Wire Line
	7290 3560 7290 4660
Connection ~ 7290 3560
Wire Wire Line
	7290 2460 7290 3560
Connection ~ 7290 2460
Wire Wire Line
	7290 1360 7290 2460
Wire Wire Line
	6000 4660 6000 5760
Connection ~ 6000 4660
Wire Wire Line
	6000 3560 6000 4660
Connection ~ 6000 3560
Wire Wire Line
	6000 2460 6000 3560
Connection ~ 6000 2460
Wire Wire Line
	6000 1360 6000 2460
Wire Wire Line
	4790 4660 4790 5760
Connection ~ 4790 4660
Wire Wire Line
	4790 3560 4790 4660
Connection ~ 4790 3560
Wire Wire Line
	4790 2460 4790 3560
Connection ~ 4790 2460
Wire Wire Line
	4790 1360 4790 2460
Wire Wire Line
	10190 5770 10190 5850
Wire Wire Line
	10090 5770 10190 5770
$Comp
L Switch:SW_DIP_x01 SW29
U 1 1 5F9143DB
P 10190 6150
F 0 "SW29" V 10144 6280 50  0000 L CNN
F 1 "SW_DIP_x01" V 10235 6280 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 10190 6150 50  0001 C CNN
F 3 "~" H 10190 6150 50  0001 C CNN
	1    10190 6150
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D29
U 1 1 5F9143D1
P 9890 5770
F 0 "D29" H 9890 6035 50  0000 C CNN
F 1 "DIODE" H 9890 5944 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 9890 5770 50  0001 C CNN
F 3 "~" H 9890 5770 50  0001 C CNN
	1    9890 5770
	1    0    0    -1  
$EndComp
Wire Wire Line
	10190 4670 10190 4760
Wire Wire Line
	10090 4670 10190 4670
$Comp
L Switch:SW_DIP_x01 SW28
U 1 1 5F9143C5
P 10190 5060
F 0 "SW28" V 10144 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 10235 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 10190 5060 50  0001 C CNN
F 3 "~" H 10190 5060 50  0001 C CNN
	1    10190 5060
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D24
U 1 1 5F914035
P 9890 4670
F 0 "D24" H 9890 4935 50  0000 C CNN
F 1 "DIODE" H 9890 4844 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 9890 4670 50  0001 C CNN
F 3 "~" H 9890 4670 50  0001 C CNN
	1    9890 4670
	1    0    0    -1  
$EndComp
Wire Wire Line
	2880 1360 2880 1460
Wire Wire Line
	2780 1360 2880 1360
$Comp
L pspice:DIODE D1
U 1 1 5F901BBB
P 2580 1360
F 0 "D1" H 2580 1625 50  0000 C CNN
F 1 "DIODE" H 2580 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2580 1360 50  0001 C CNN
F 3 "~" H 2580 1360 50  0001 C CNN
	1    2580 1360
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW27
U 1 1 5F8CF96F
P 8990 6150
F 0 "SW27" V 8944 6280 50  0000 L CNN
F 1 "SW_DIP_x01" V 9035 6280 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8990 6150 50  0001 C CNN
F 3 "~" H 8990 6150 50  0001 C CNN
	1    8990 6150
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D28
U 1 1 5F8CF965
P 8690 5770
F 0 "D28" H 8690 6035 50  0000 C CNN
F 1 "DIODE" H 8690 5944 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8690 5770 50  0001 C CNN
F 3 "~" H 8690 5770 50  0001 C CNN
	1    8690 5770
	1    0    0    -1  
$EndComp
Wire Wire Line
	8990 4660 8990 4760
Wire Wire Line
	8890 4660 8990 4660
$Comp
L Switch:SW_DIP_x01 SW1
U 1 1 5F8CF959
P 8990 5060
F 0 "SW1" V 8944 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 9035 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8990 5060 50  0001 C CNN
F 3 "~" H 8990 5060 50  0001 C CNN
	1    8990 5060
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D23
U 1 1 5F8CF94F
P 8690 4660
F 0 "D23" H 8690 4925 50  0000 C CNN
F 1 "DIODE" H 8690 4834 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8690 4660 50  0001 C CNN
F 3 "~" H 8690 4660 50  0001 C CNN
	1    8690 4660
	1    0    0    -1  
$EndComp
Wire Wire Line
	8990 3560 8990 3660
Wire Wire Line
	8890 3560 8990 3560
$Comp
L Switch:SW_DIP_x01 SW2
U 1 1 5F8CF943
P 8990 3960
F 0 "SW2" V 8944 4090 50  0000 L CNN
F 1 "SW_DIP_x01" V 9035 4090 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8990 3960 50  0001 C CNN
F 3 "~" H 8990 3960 50  0001 C CNN
	1    8990 3960
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D18
U 1 1 5F8CF939
P 8690 3560
F 0 "D18" H 8690 3825 50  0000 C CNN
F 1 "DIODE" H 8690 3734 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8690 3560 50  0001 C CNN
F 3 "~" H 8690 3560 50  0001 C CNN
	1    8690 3560
	1    0    0    -1  
$EndComp
Wire Wire Line
	8990 2460 8990 2560
Wire Wire Line
	8890 2460 8990 2460
$Comp
L Switch:SW_DIP_x01 SW3
U 1 1 5F8CF92D
P 8990 2860
F 0 "SW3" V 8944 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 9035 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8990 2860 50  0001 C CNN
F 3 "~" H 8990 2860 50  0001 C CNN
	1    8990 2860
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D12
U 1 1 5F8CF923
P 8690 2460
F 0 "D12" H 8690 2725 50  0000 C CNN
F 1 "DIODE" H 8690 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8690 2460 50  0001 C CNN
F 3 "~" H 8690 2460 50  0001 C CNN
	1    8690 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	8990 1360 8990 1460
Wire Wire Line
	8890 1360 8990 1360
$Comp
L Switch:SW_DIP_x01 SW4
U 1 1 5F8CF917
P 8990 1760
F 0 "SW4" V 8944 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 9035 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 8990 1760 50  0001 C CNN
F 3 "~" H 8990 1760 50  0001 C CNN
	1    8990 1760
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D6
U 1 1 5F8CF667
P 8690 1360
F 0 "D6" H 8690 1625 50  0000 C CNN
F 1 "DIODE" H 8690 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 8690 1360 50  0001 C CNN
F 3 "~" H 8690 1360 50  0001 C CNN
	1    8690 1360
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW5
U 1 1 5F880401
P 7790 6150
F 0 "SW5" V 7744 6280 50  0000 L CNN
F 1 "SW_DIP_x01" V 7835 6280 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7790 6150 50  0001 C CNN
F 3 "~" H 7790 6150 50  0001 C CNN
	1    7790 6150
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D27
U 1 1 5F880171
P 7490 5770
F 0 "D27" H 7490 6035 50  0000 C CNN
F 1 "DIODE" H 7490 5944 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7490 5770 50  0001 C CNN
F 3 "~" H 7490 5770 50  0001 C CNN
	1    7490 5770
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 4660 4090 4760
Wire Wire Line
	3990 4660 4090 4660
$Comp
L Switch:SW_DIP_x01 SW20
U 1 1 5F862807
P 4090 5060
F 0 "SW20" V 4044 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 4135 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4090 5060 50  0001 C CNN
F 3 "~" H 4090 5060 50  0001 C CNN
	1    4090 5060
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D19
U 1 1 5F8627FD
P 3790 4660
F 0 "D19" H 3790 4925 50  0000 C CNN
F 1 "DIODE" H 3790 4834 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3790 4660 50  0001 C CNN
F 3 "~" H 3790 4660 50  0001 C CNN
	1    3790 4660
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 3560 4090 3660
Wire Wire Line
	3990 3560 4090 3560
$Comp
L Switch:SW_DIP_x01 SW21
U 1 1 5F8627F1
P 4090 3960
F 0 "SW21" V 4044 4090 50  0000 L CNN
F 1 "SW_DIP_x01" V 4135 4090 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4090 3960 50  0001 C CNN
F 3 "~" H 4090 3960 50  0001 C CNN
	1    4090 3960
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D14
U 1 1 5F8627E7
P 3790 3560
F 0 "D14" H 3790 3825 50  0000 C CNN
F 1 "DIODE" H 3790 3734 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3790 3560 50  0001 C CNN
F 3 "~" H 3790 3560 50  0001 C CNN
	1    3790 3560
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 2460 4090 2560
Wire Wire Line
	3990 2460 4090 2460
$Comp
L Switch:SW_DIP_x01 SW22
U 1 1 5F8627DB
P 4090 2860
F 0 "SW22" V 4044 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 4135 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4090 2860 50  0001 C CNN
F 3 "~" H 4090 2860 50  0001 C CNN
	1    4090 2860
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D8
U 1 1 5F8627D1
P 3790 2460
F 0 "D8" H 3790 2725 50  0000 C CNN
F 1 "DIODE" H 3790 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3790 2460 50  0001 C CNN
F 3 "~" H 3790 2460 50  0001 C CNN
	1    3790 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	4090 1360 4090 1460
Wire Wire Line
	3990 1360 4090 1360
$Comp
L pspice:DIODE D2
U 1 1 5F8627BB
P 3790 1360
F 0 "D2" H 3790 1625 50  0000 C CNN
F 1 "DIODE" H 3790 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 3790 1360 50  0001 C CNN
F 3 "~" H 3790 1360 50  0001 C CNN
	1    3790 1360
	1    0    0    -1  
$EndComp
Wire Wire Line
	7790 4660 7790 4760
Wire Wire Line
	7690 4660 7790 4660
$Comp
L Switch:SW_DIP_x01 SW6
U 1 1 5F8627AF
P 7790 5060
F 0 "SW6" V 7744 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 7835 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7790 5060 50  0001 C CNN
F 3 "~" H 7790 5060 50  0001 C CNN
	1    7790 5060
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D22
U 1 1 5F8627A5
P 7490 4660
F 0 "D22" H 7490 4925 50  0000 C CNN
F 1 "DIODE" H 7490 4834 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7490 4660 50  0001 C CNN
F 3 "~" H 7490 4660 50  0001 C CNN
	1    7490 4660
	1    0    0    -1  
$EndComp
Wire Wire Line
	7790 3560 7790 3660
Wire Wire Line
	7690 3560 7790 3560
$Comp
L Switch:SW_DIP_x01 SW7
U 1 1 5F862799
P 7790 3960
F 0 "SW7" V 7744 4090 50  0000 L CNN
F 1 "SW_DIP_x01" V 7835 4090 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7790 3960 50  0001 C CNN
F 3 "~" H 7790 3960 50  0001 C CNN
	1    7790 3960
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D17
U 1 1 5F86278F
P 7490 3560
F 0 "D17" H 7490 3825 50  0000 C CNN
F 1 "DIODE" H 7490 3734 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7490 3560 50  0001 C CNN
F 3 "~" H 7490 3560 50  0001 C CNN
	1    7490 3560
	1    0    0    -1  
$EndComp
Wire Wire Line
	7790 2460 7790 2560
Wire Wire Line
	7690 2460 7790 2460
$Comp
L Switch:SW_DIP_x01 SW8
U 1 1 5F862783
P 7790 2860
F 0 "SW8" V 7744 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 7835 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7790 2860 50  0001 C CNN
F 3 "~" H 7790 2860 50  0001 C CNN
	1    7790 2860
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D11
U 1 1 5F862779
P 7490 2460
F 0 "D11" H 7490 2725 50  0000 C CNN
F 1 "DIODE" H 7490 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7490 2460 50  0001 C CNN
F 3 "~" H 7490 2460 50  0001 C CNN
	1    7490 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	7790 1360 7790 1460
Wire Wire Line
	7690 1360 7790 1360
$Comp
L Switch:SW_DIP_x01 SW9
U 1 1 5F86276D
P 7790 1760
F 0 "SW9" V 7744 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 7835 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 7790 1760 50  0001 C CNN
F 3 "~" H 7790 1760 50  0001 C CNN
	1    7790 1760
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D5
U 1 1 5F8625DD
P 7490 1360
F 0 "D5" H 7490 1625 50  0000 C CNN
F 1 "DIODE" H 7490 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 7490 1360 50  0001 C CNN
F 3 "~" H 7490 1360 50  0001 C CNN
	1    7490 1360
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 5760 6500 5850
Wire Wire Line
	6400 5760 6500 5760
$Comp
L pspice:DIODE D26
U 1 1 5F857803
P 6200 5760
F 0 "D26" H 6200 6025 50  0000 C CNN
F 1 "DIODE" H 6200 5934 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6200 5760 50  0001 C CNN
F 3 "~" H 6200 5760 50  0001 C CNN
	1    6200 5760
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 4660 6500 4760
Wire Wire Line
	6400 4660 6500 4660
$Comp
L pspice:DIODE D21
U 1 1 5F8577ED
P 6200 4660
F 0 "D21" H 6200 4925 50  0000 C CNN
F 1 "DIODE" H 6200 4834 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6200 4660 50  0001 C CNN
F 3 "~" H 6200 4660 50  0001 C CNN
	1    6200 4660
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 3560 6500 3660
Wire Wire Line
	6400 3560 6500 3560
$Comp
L Switch:SW_DIP_x01 SW12
U 1 1 5F8577E1
P 6500 3960
F 0 "SW12" V 6454 4090 50  0000 L CNN
F 1 "SW_DIP_x01" V 6545 4090 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6500 3960 50  0001 C CNN
F 3 "~" H 6500 3960 50  0001 C CNN
	1    6500 3960
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D16
U 1 1 5F8577D7
P 6200 3560
F 0 "D16" H 6200 3825 50  0000 C CNN
F 1 "DIODE" H 6200 3734 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6200 3560 50  0001 C CNN
F 3 "~" H 6200 3560 50  0001 C CNN
	1    6200 3560
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 2460 6500 2560
Wire Wire Line
	6400 2460 6500 2460
$Comp
L Switch:SW_DIP_x01 SW13
U 1 1 5F8577CB
P 6500 2860
F 0 "SW13" V 6454 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 6545 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6500 2860 50  0001 C CNN
F 3 "~" H 6500 2860 50  0001 C CNN
	1    6500 2860
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D10
U 1 1 5F8577C1
P 6200 2460
F 0 "D10" H 6200 2725 50  0000 C CNN
F 1 "DIODE" H 6200 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6200 2460 50  0001 C CNN
F 3 "~" H 6200 2460 50  0001 C CNN
	1    6200 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	6500 1360 6500 1460
Wire Wire Line
	6400 1360 6500 1360
$Comp
L Switch:SW_DIP_x01 SW14
U 1 1 5F8577B5
P 6500 1760
F 0 "SW14" V 6454 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 6545 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6500 1760 50  0001 C CNN
F 3 "~" H 6500 1760 50  0001 C CNN
	1    6500 1760
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D4
U 1 1 5F8576C5
P 6200 1360
F 0 "D4" H 6200 1625 50  0000 C CNN
F 1 "DIODE" H 6200 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 6200 1360 50  0001 C CNN
F 3 "~" H 6200 1360 50  0001 C CNN
	1    6200 1360
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 5760 5290 5850
Wire Wire Line
	5190 5760 5290 5760
$Comp
L Switch:SW_DIP_x01 SW15
U 1 1 5F85160B
P 5290 6150
F 0 "SW15" V 5244 6280 50  0000 L CNN
F 1 "SW_DIP_x01" V 5335 6280 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5290 6150 50  0001 C CNN
F 3 "~" H 5290 6150 50  0001 C CNN
	1    5290 6150
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D25
U 1 1 5F85153B
P 4990 5760
F 0 "D25" H 4990 6025 50  0000 C CNN
F 1 "DIODE" H 4990 5934 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4990 5760 50  0001 C CNN
F 3 "~" H 4990 5760 50  0001 C CNN
	1    4990 5760
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 4660 5290 4760
Wire Wire Line
	5190 4660 5290 4660
$Comp
L Switch:SW_DIP_x01 SW16
U 1 1 5F8495F0
P 5290 5060
F 0 "SW16" V 5244 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 5335 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5290 5060 50  0001 C CNN
F 3 "~" H 5290 5060 50  0001 C CNN
	1    5290 5060
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D20
U 1 1 5F8495E6
P 4990 4660
F 0 "D20" H 4990 4925 50  0000 C CNN
F 1 "DIODE" H 4990 4834 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4990 4660 50  0001 C CNN
F 3 "~" H 4990 4660 50  0001 C CNN
	1    4990 4660
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 3560 5290 3660
Wire Wire Line
	5190 3560 5290 3560
$Comp
L Switch:SW_DIP_x01 SW17
U 1 1 5F8495DA
P 5290 3960
F 0 "SW17" V 5244 4090 50  0000 L CNN
F 1 "SW_DIP_x01" V 5335 4090 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5290 3960 50  0001 C CNN
F 3 "~" H 5290 3960 50  0001 C CNN
	1    5290 3960
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D15
U 1 1 5F849582
P 4990 3560
F 0 "D15" H 4990 3825 50  0000 C CNN
F 1 "DIODE" H 4990 3734 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4990 3560 50  0001 C CNN
F 3 "~" H 4990 3560 50  0001 C CNN
	1    4990 3560
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 2460 5290 2560
Wire Wire Line
	5190 2460 5290 2460
$Comp
L Switch:SW_DIP_x01 SW18
U 1 1 5F8436F6
P 5290 2860
F 0 "SW18" V 5244 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 5335 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5290 2860 50  0001 C CNN
F 3 "~" H 5290 2860 50  0001 C CNN
	1    5290 2860
	0    -1   -1   0   
$EndComp
$Comp
L pspice:DIODE D9
U 1 1 5F8436EC
P 4990 2460
F 0 "D9" H 4990 2725 50  0000 C CNN
F 1 "DIODE" H 4990 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4990 2460 50  0001 C CNN
F 3 "~" H 4990 2460 50  0001 C CNN
	1    4990 2460
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 1360 5290 1460
Wire Wire Line
	5190 1360 5290 1360
$Comp
L pspice:DIODE D3
U 1 1 5F8324EB
P 4990 1360
F 0 "D3" H 4990 1625 50  0000 C CNN
F 1 "DIODE" H 4990 1534 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 4990 1360 50  0001 C CNN
F 3 "~" H 4990 1360 50  0001 C CNN
	1    4990 1360
	1    0    0    -1  
$EndComp
Wire Wire Line
	5290 6450 1420 6450
Connection ~ 5290 6450
Wire Wire Line
	1430 5360 4090 5360
Connection ~ 4090 5360
Wire Wire Line
	1420 4260 2880 4260
Connection ~ 4090 4260
Connection ~ 4090 3160
Wire Wire Line
	2780 2460 2880 2460
Wire Wire Line
	2880 2460 2880 2560
$Comp
L Switch:SW_DIP_x01 SW25
U 1 1 5F901F21
P 2880 2860
F 0 "SW25" V 2834 2990 50  0000 L CNN
F 1 "SW_DIP_x01" V 2925 2990 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2880 2860 50  0001 C CNN
F 3 "~" H 2880 2860 50  0001 C CNN
	1    2880 2860
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1420 3160 2880 3160
Connection ~ 2880 3160
$Comp
L pspice:DIODE D13
U 1 1 6049254E
P 2580 3490
F 0 "D13" H 2580 3755 50  0000 C CNN
F 1 "DIODE" H 2580 3664 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2580 3490 50  0001 C CNN
F 3 "~" H 2580 3490 50  0001 C CNN
	1    2580 3490
	1    0    0    -1  
$EndComp
$Comp
L Switch:SW_DIP_x01 SW24
U 1 1 60492C9A
P 2880 3870
F 0 "SW24" V 2834 4000 50  0000 L CNN
F 1 "SW_DIP_x01" V 2925 4000 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2880 3870 50  0001 C CNN
F 3 "~" H 2880 3870 50  0001 C CNN
	1    2880 3870
	0    -1   -1   0   
$EndComp
Connection ~ 2380 1360
Wire Wire Line
	2380 2460 2380 3490
Wire Wire Line
	2380 1360 2380 2460
$Comp
L pspice:DIODE D7
U 1 1 5F901F17
P 2580 2460
F 0 "D7" H 2580 2725 50  0000 C CNN
F 1 "DIODE" H 2580 2634 50  0000 C CNN
F 2 "Diode_SMD:D_SOD-323_HandSoldering" H 2580 2460 50  0001 C CNN
F 3 "~" H 2580 2460 50  0001 C CNN
	1    2580 2460
	1    0    0    -1  
$EndComp
Connection ~ 2380 2460
Wire Wire Line
	2780 3490 2880 3490
Wire Wire Line
	2880 3490 2880 3570
Wire Wire Line
	2880 4170 2880 4260
Connection ~ 2880 4260
Wire Wire Line
	1420 2060 2880 2060
Connection ~ 2880 2060
Wire Wire Line
	2380 870  2380 790 
Connection ~ 2380 870 
Wire Wire Line
	3590 1360 3590 1220
Connection ~ 3590 1360
Wire Wire Line
	4790 1360 4790 1230
Connection ~ 4790 1360
Wire Wire Line
	6000 1360 6000 1220
Connection ~ 6000 1360
Wire Wire Line
	7290 1360 7290 1220
Connection ~ 7290 1360
Wire Wire Line
	8490 1360 8490 1220
Connection ~ 8490 1360
Text HLabel 2380 790  1    50   Input ~ 0
col0
Text HLabel 3590 1220 1    50   Input ~ 0
col1
Text HLabel 4790 1230 1    50   Input ~ 0
col2
Text HLabel 6000 1220 1    50   Input ~ 0
col3
Text HLabel 7290 1220 1    50   Input ~ 0
col4
Text HLabel 8490 1220 1    50   Input ~ 0
col5
Text HLabel 1420 2060 0    50   Output ~ 0
row0
Text HLabel 1420 3160 0    50   Output ~ 0
row1
Text HLabel 1420 4260 0    50   Output ~ 0
row2
Text HLabel 1430 5360 0    50   Output ~ 0
row3
Text HLabel 1420 6450 0    50   Output ~ 0
row4
$Comp
L Switch:SW_DIP_x01 SW19
U 1 1 5F838477
P 5290 1760
F 0 "SW19" V 5244 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 5335 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 5290 1760 50  0001 C CNN
F 3 "~" H 5290 1760 50  0001 C CNN
	1    5290 1760
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW23
U 1 1 5F8627C5
P 4090 1760
F 0 "SW23" V 4044 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 4135 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 4090 1760 50  0001 C CNN
F 3 "~" H 4090 1760 50  0001 C CNN
	1    4090 1760
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW26
U 1 1 5F901F0B
P 2880 1760
F 0 "SW26" V 2834 1890 50  0000 L CNN
F 1 "SW_DIP_x01" V 2925 1890 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 2880 1760 50  0001 C CNN
F 3 "~" H 2880 1760 50  0001 C CNN
	1    2880 1760
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2880 2060 4090 2060
Wire Wire Line
	4090 2060 5290 2060
Wire Wire Line
	5290 2060 6500 2060
Wire Wire Line
	5290 3160 6500 3160
Wire Wire Line
	4090 3160 5290 3160
Wire Wire Line
	2880 3160 4090 3160
Wire Wire Line
	2880 4260 4090 4260
Wire Wire Line
	4090 4260 5290 4260
Wire Wire Line
	5290 4260 6500 4260
Wire Wire Line
	4090 5360 5290 5360
Wire Wire Line
	5290 5360 6500 5360
Wire Wire Line
	5290 6450 6500 6450
Wire Wire Line
	6500 6450 7790 6450
Wire Wire Line
	7790 6450 8990 6450
Wire Wire Line
	7790 5360 8990 5360
Wire Wire Line
	6500 5360 7790 5360
Wire Wire Line
	6500 4260 7790 4260
Wire Wire Line
	6500 3160 7790 3160
Wire Wire Line
	6500 2060 7790 2060
Wire Wire Line
	7790 2060 8990 2060
Wire Wire Line
	7790 3160 8990 3160
Wire Wire Line
	8990 5360 10190 5360
Wire Wire Line
	8990 6450 10190 6450
Wire Wire Line
	7790 4260 8990 4260
Wire Notes Line
	8380 5450 9380 5450
Wire Notes Line
	9380 5450 9380 4250
Wire Notes Line
	9380 4250 10610 4250
Wire Notes Line
	10610 4250 10610 6770
Wire Notes Line
	10610 6770 8380 6770
Wire Notes Line
	8380 5450 8380 6770
Text Notes 9820 6670 0    50   ~ 0
Thumb buttons
$Comp
L Switch:SW_DIP_x01 SW11
U 1 1 5F8577F7
P 6500 5060
F 0 "SW11" V 6454 5190 50  0000 L CNN
F 1 "SW_DIP_x01" V 6545 5190 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6500 5060 50  0001 C CNN
F 3 "~" H 6500 5060 50  0001 C CNN
	1    6500 5060
	0    -1   -1   0   
$EndComp
$Comp
L Switch:SW_DIP_x01 SW10
U 1 1 5F85780D
P 6500 6150
F 0 "SW10" V 6454 6280 50  0000 L CNN
F 1 "SW_DIP_x01" V 6545 6280 50  0000 L CNN
F 2 "Button_Switch_Keyboard:SW_Cherry_MX_1.00u_PCB" H 6500 6150 50  0001 C CNN
F 3 "~" H 6500 6150 50  0001 C CNN
	1    6500 6150
	0    -1   -1   0   
$EndComp
Text Notes 4180 6890 0    50   ~ 0
Annotations of switches are tied to the mechanical model.\nDO NOT REANNOTATE.
$EndSCHEMATC

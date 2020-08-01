#Makefile for Group Project 2

TARGET	=	Sensor

ASRCS	=	$(wildcard *.S)
INTTBL	=	FALSE

#Board Definition
MCU	=	atmega328p
F_CPU	=	16000000

#do not modify anything below this line except the PORT setting
ifeq ($(OS),Windows_NT)
	include c:/usr/local/include/Makefile.win
	PORT = COM3
else
	UNAME_S = $(shell uname -s)
	ifeq ($(UNAME_S), Linux)
		include /usr/local/include/Makefile.unx
		PORT = /dev/ttyACM0
	endif
	ifeq ($(UNAME_S), Darwin)
		include /usr/local/include/Makefile.mac
		PORT = /dev/cu.usbmodem1411
	endif
endif

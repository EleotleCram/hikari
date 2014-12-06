# where the Arduino software is installed
export ARDUINODIR=/opt/arduino-1.0.4-SF32U4/

# what is the Arduino board variant
BOARD := promicro16

# include the shared ed.am Arduino Makefile
include ../arduino-mk/arduino.mk

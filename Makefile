# where the Arduino software is installed
export ARDUINODIR=/opt/arduino-1.5.8

# what is the Arduino board variant
#BOARD := nano_atmega328
BOARD := promicro16

# extra c++ compiler flags
CPPFLAGS := -std=c++11 -Iustdlibcc/include/

# include the plugins.mk from the arduino-bus module
include abus/plugins.mk
# include the shared ed.am Arduino Makefile
include arduino-mk/arduino.mk

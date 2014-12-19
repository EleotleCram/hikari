# where the Arduino software is installed
export ARDUINODIR=/opt/arduino-1.5.8

# what is the Arduino board variant
BOARD := promicro16

# extra c++ compiler flags
CPPFLAGS := -std=c++11 -Iustdlibcc/include/

# extra sources can be found in the plugins/ folder
SOURCES := $(wildcard $(addprefix plugins/, *.c *.cc *.cpp *.C))

# plugin magic
PLUGINS := $(notdir $(basename $(wildcard $(addprefix plugins/, *.c *.cc *.cpp *.C))))
PLUGIN_MSG_BASES := $(shell echo "$(PLUGINS)" | tr " " "\n" | tr "a-z" "A-Z" | awk '{print "-DMSG_BASE_"$$1"="(FNR-1)*100}')
CPPFLAGS += $(PLUGIN_MSG_BASES)
CFLAGS += $(PLUGIN_MSG_BASES)

CLEAN_ALSO := plugins.h
empty :=
space := 
space +=
plugins.h: plugins/ Makefile
	echo >$@ "#define PLUGINS \\\\\n\\t$(subst $(space), \\\\\n\\t,$(strip $(patsubst %,X(%),$(PLUGINS))))"

foo:
	@echo "$(PLUGINS)" | tr " " "\n" | awk '{print "-D"$$1"="(FNR-1)*100}'

# include the shared ed.am Arduino Makefile
include arduino-mk/arduino.mk

Hikari
======

RGB LED controller project


Prerequisites
=============

* Arduino with atmega32u4 (3 x 16-bit PWM RGB channels) or atmega328p (2 x 16-bit / 1 x 8 - bit PWM RGB channels)
* GCC-AVR 4.9.2 (Tool chain available through PATH)
* Arduino software (1.5.8; preferably installed in /opt/arduino-1.5.8)
* The correct version of the sub-modules (git submodule update --init)

Optional:
* ~/sketchbook/hardware/SF32u4_boards¹ (When using the Sparkfun PRO micro² or clone³)

¹ - https://github.com/sparkfun/SF32u4_boards/archive/master.zip<br>
² - https://www.sparkfun.com/products/12640<br>
³ - http://www.ebay.com/itm/310634777706<br>


Build
=====

After getting and installing the prerequisites, just run `make`, `make size`, or `make upload`

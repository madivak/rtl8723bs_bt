#!/bin/bash
#launch Bluetooth driver

#configuration to get pin BT_WAKE & BT-WK-HOST pin to register, be gpio_out and turned on

echo "239"  > /sys/class/gpio/export   #PH15 BT-WK-HOST
echo "in"  > /sys/class/gpio/gpio239/direction  
echo "rising"  > /sys/class/gpio/gpio239/edge

echo "238" > /sys/class/gpio/export  #PH14 BT-WK-UP
echo "out" > /sys/class/gpio/gpio238/direction
echo "1" > /sys/class/gpio/gpio238/value

rtk_hciattach -n -b -s 115200 /dev/ttyS2 rtk_h5 > hciattach.txt 2>&1 & #BT attached to serial /dev/tty

/bin/sleep 5		#allow hci0 interface to initialise

hciconfig               #show if hci inteface is up

hciconfig hci0 up       #bring up the hci inteface

hciconfig -a            #show if hci inteface is up

hciconfig hci0 piscan   #Make my device discoverable

hcitool scan            #scan available BT signals

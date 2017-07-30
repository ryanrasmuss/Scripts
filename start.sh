#!/bin/bash

# purpose: quick monitor of APs around me
# for: kali linux 
# problems: different interface name and unreliable mon interface name

echo "Dropping interface .."
ifconfig wlan0 down
echo "Changing mac address .."
macchanger -r wlan0
echo "Bringing up interface .."
ifconfig wlan0 up
echo "Killing annoying processes .."
airmon-ng check kill
echo "Creating monitor interface .."
airmon-ng start wlan0
echo "Starting airodump .."
airodump-ng wlan0mon

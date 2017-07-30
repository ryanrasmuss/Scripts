#!/bin/bash

# For monitoring a particular AP

if [ $1 == '-h' ] || [ $# != 3]; then
	echo "Usage: [bssid] [channel#] [fileToWrite]"
	echo "Assuming monitor inteface name: wlan0mon"
else
	airodump-ng --bssid $1 --channel $2 --write $3 wlan0mon
fi

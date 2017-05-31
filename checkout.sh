#! For monitoring a particular AP

if [ $1 == '-h' ]; then
	echo "Usage: [bssid] [fileToWrite]"
	echo "Assuming monitor inteface name: wlan0mon"
fi
if [ $# != 2 ]; then
	echo "Usage: [bssid] [fileToWrite]"
	echo "Assuming monitor inteface name: wlan0mon"
else
	airodump-ng --bssid $1 --write $2 wlan0mon
fi

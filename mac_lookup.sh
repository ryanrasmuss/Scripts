#!/bin/bash

# Simple mac lookup script
# Author: Ryan Rasmuss
# grep -i "2c-f0-ee" /var/lib/ieee-data/oui.txt
# $1 mac_address_to_lookup

lookup=/var/lib/ieee-data/oui.txt

if [ $# != 1 ] || [ $1 == '-h' ] || [ $1 == '--help' ] || [ $1 == '--h' ]; then
    echo "usage: <./mac_lookup.sh> <mac_address>|<--help>|<--update>"
    echo "example: ./mac_lookup.sh 2c-f0-ee"
    echo "example: ./mac_lookup.sh 2cf0ee"
    exit
elif [ $1 == '--update' ]; then
    apt-get install ieee-data -y
    exit
else
    grep -i "$1" $lookup
fi

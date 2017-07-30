#!/bin/bash

# grep -i "2c-f0-ee" /var/lib/ieee-data/oui.txt
# $1 mac_address_to_lookup

if [ $# != 1 ] || [ $1 == '-h' ]; then
    echo "usage: ./mac_lookup.sh mac_address"
    echo "example: ./mac_lookup.sh 2c-f0-ee"
    echo "example: ./mac_lookup.sh 2cf0ee"
    exit
else
    grep -i "$1" /var/lib/ieee-data/oui.txt
fi


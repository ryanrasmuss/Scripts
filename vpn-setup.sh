#!/bin/bash

dir=/etc/openvpn

cd $dir

if [ -d "ovpn_tcp" ] || [ -d "ovpn_udp" ]; then
    echo "vpn files already made at dir: $dir"
else
    echo "Directory: $dir"
    echo "call: openvpn ovpn_tcp/....com.tcp.ovpn"
    echo "Initializing the files.. "
    echo "Installing openvpn.. "
    apt-get install openvpn -y
    echo "Getting ovpn.zip.. "
    wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
    echo "Instaling ca-certificates & unzip.. "
    apt-get install ca-certificates -y
    apt-get install unzip -y
    echo "Unzipping archive.. "
    unzip ovpn.zip
    echo "Shredding archive.. "
    shred -zu ovpn.zip

    echo "DONE."
fi

echo "Usage: openvpn $dir/ovpn_tcp/xxx.com.tcp.ovpn"

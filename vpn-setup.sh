#!/bin/bash

dir=/etc/openvpn

apt-get install openvpn -y
echo "Changing directory: $dir"
cd $dir
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
apt-get install ca-certificates -y
apt-get install unzip -y
unzip ovpn.zip
echo "Shredding zip.. "
shred -zu ovpn.zip
echo "Connect @$dir: openvpn ovpn_tcp/us998.nordvpn.com.tcp.ovpn"
# may want to ask if we want to connect to default

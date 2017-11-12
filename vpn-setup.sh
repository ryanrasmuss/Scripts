#!/bin/bash

apt-get install openvpn -y
cd /etc/openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
apt-get install ca-certificates -y
apt-get install unzip -y
unzip ovpn.zip
shred -zu ovpn.zip
openvpn ovpn_tcp/us998.nordvpn.com.tcp.ovpn

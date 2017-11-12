#!/bin/bash

# Set up environment

dir=/root/.bash_aliases
touch $dir
echo "alias bp='vim ~/.bash_profile'" > $dir
echo "alias please='sudo \$(history | cut -c 8- | tail -2 | awk \"FNR == 1 {print}\")'" >> $dir
source $dir
source /root/.bashrc

dir=/root/.vimrc
echo "syntax enable" > $dir
echo "set number" >> $dir
echo "filetype plugin indent on" >> $dir
echo "set tabstop=4" >> $dir
echo "set expandtab" >> $dir

# Set up keys & git clones

mkdir /root/.ssh
cat /media/root/TOSHIBA\ EXT/private_key > /root/.ssh/id_rsa
cat /media/root/TOSHIBA\ EXT/public_key > /root/.ssh/id_rsa.pub

apt-get install git -y

git clone git@github.com:ryanrasmuss/simple_firewall.git
git clone git@github.com:ryanrasmuss/simple_botnet.git
git clone git@github.com:ryanrasmuss/NOTES.git
git clone git@github.com:ryanrasmuss/personal-scripts.git

# Set up vpn

apt-get install openvpn -y
#cd /etc/openvpn
wget https://downloads.nordcdn.com/configs/archives/servers/ovpn.zip
apt-get install ca-certificates -y
apt-get install unzip -y
unzip ovpn.zip
rm ovpn.zip
openvpn ovpn_tcp/us998.nordvpn.com.tcp.ovpn

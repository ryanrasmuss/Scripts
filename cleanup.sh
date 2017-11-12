#!/bin/bash

dir=$HOME/.ssh
ovpn_dir=/etc/openvpn

# add verbose options

# Ruled this as overkill
#echo "Removing local ovpns.. "
#shred -vzu $ovpn_dir/ovpn_udp/*
#shred -vzu $ovpn_dir/ovpn_tcp/*
#rmdir $ovpn_dir/ovpn_udp
#rmdir $ovpn_dir/ovpn_tcp

echo "Removing ssh keys.."
shred -vzu $dir/id_rsa
shred -vzu $dir/id_rsa.pub

echo "Done."

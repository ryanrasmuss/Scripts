#!/bin/bash

dir=$HOME/.ssh

echo "Removing local ovpns.. "
shred -zu ovpn_udp/*
shred -zu ovpn_tcp/*

echo "Removing ssh keys.."
shred -zu $dir/id_rsa
shred -zu $dir/id_rsa.pub

echo "Done."

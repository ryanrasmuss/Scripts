#!/bin/bash

dir=$HOME/.ssh

mkdir -p $dir

unzip keys.zip

echo "Writing keys to $dir"
cat private_key > $dir/id_rsa
cat public_key > $dir/id_rsa.pub

echo "Shredding local keys.."
shred -zu private_key
shred -zu public_key

echo "Done."
echo "Example: git@github.com:username/project.git"

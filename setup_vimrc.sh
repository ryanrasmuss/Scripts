#!/bin/bash

# Need to detect duplicates and stop the command

dir=$HOME/.vimrc

echo "APPENDING SETTINGS TO $dir"

echo "set number" >> $dir
echo "syntax enable" >> $dir
echo "filetype plugin indent on" >> $dir
echo "set shiftwidth=4" >> $dir
echo "set expandtab" >> $dir

echo "DONE"

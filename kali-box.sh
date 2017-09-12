#!/bin/bash

#VBoxManage startvm kali --type headless
#echo "Establishing ssh... "
#ssh -l root -p 14501 localhost
# VBoxManage controlvm [name] poweroff

VBoxManage startvm kali --type=headless
ssh -l root -p 16000 localhost

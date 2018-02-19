#!/bin/bash

if [ $# == 1 ]; then
    VBoxManage list $1
elif [ $# == 2 ]; then
    if [ $2 == 'start' ]; then
        VBoxManage startvm $1 
        VBoxManage showvminfo $1
    else
        VBoxManage controlvm $1 $2
    fi
else
    echo "Usage: {<runningvms|vms>} | {VM_name, poweroff|pause|start}"
fi

#!/bin/bash

output="$(``VBoxManage list runningvms | grep "Dev-Box-32"``)"
if [[ -z $output ]]; then
    VBoxManage startvm Dev-Box-32 --type=headless
    ssh -l user -p 16001 localhost
else
    echo "Dev-Box-32 is already up"
fi

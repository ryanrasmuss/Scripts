PATH=%PATH%;C:\Program Files\Oracle\VirtualBox
VBoxManage startvm Dev --type=headless
start Putty -ssh -l user -P 16000 localhost
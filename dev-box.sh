#!/bin/bash
VBoxManage startvm Dev-Box-32 --type=headless
ssh -l user -p 16001 localhost

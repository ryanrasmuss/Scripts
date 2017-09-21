#!/bin/bash
VBoxManage startvm Dev --type=headless
ssh -l user -p 16001 localhost

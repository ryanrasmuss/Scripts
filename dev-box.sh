#!/bin/bash
VBoxManage startvm Dev --type=headless
ssh -l user -p 16000 localhost

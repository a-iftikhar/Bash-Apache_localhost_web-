#!/bin/bash

#instalations first 

sudo apt install sysstat -y
sudo apt install shpass

#check process and store it in sar command

sar 1 6 >> sar.txt

#secure copy command to send file to nisum vm

sshpass -p 'nisum' scp "sar.txt" nisum@192.168.6.129:/home/nisum/


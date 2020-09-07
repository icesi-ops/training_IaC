#!/bin/bash

ipaddr=$(hostname -I)
hostname=$(cat /etc/hostname)
Timestamp=$(date)

echo "HOSTNAME = "$hostname"; IP = "$ipaddr"; TIEMPO =  "$Timestamp

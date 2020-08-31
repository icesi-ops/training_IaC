#!/bin/bash
variable=$(hostname)
variable1=$(hostname -i)
variable2=$(date +%s)
echo -HOSTNAME: $variable -IP: $variable1 -Timestamp: $variable2

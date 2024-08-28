#!/bin/bash

PREFIX=$1

IP_ADDRESS=$(ip addr show dev eth0 | grep 'inet' | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" | head -n 1)

if [ -n "$IP_ADDRESS" ]; then
    echo "$PREFIX: $IP_ADDRESS" >/dev/ttyPS0
else
    echo "Unable to extract IP address from eth0 interface" >/dev/ttyPS0
fi

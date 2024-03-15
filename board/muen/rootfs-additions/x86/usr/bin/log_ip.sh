#!/bin/bash

IP_ADDRESS=$(ip addr show dev br0 | grep 'inet' | grep -oE "([0-9]{1,3}\.){3}[0-9]{1,3}" | head -n 1)

if [ -n "$IP_ADDRESS" ]; then
    echo "NCI-DHCP_IP: $IP_ADDRESS" >/dev/ttyS0
else
    echo "Unable to extract IP address from br0 interface" >/dev/ttyS0
fi

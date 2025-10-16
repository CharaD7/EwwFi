#!/bin/bash

# Get current connection
current=$(iwctl station wlan0 show | grep 'Connected network' | awk -F': ' '{print $2}')

# Get available networks
networks=$(iwctl station wlan0 get-networks | awk '/SSID/ {print $2}')

# Output for Eww
echo "{ \"current\": \"$current\", \"networks\": [$(echo "$networks" | jq -R -s -c 'split("\n")[:-1]')] }"


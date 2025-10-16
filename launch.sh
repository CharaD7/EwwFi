#!/bin/bash
CONFIG_DIR="/home/charad7/Developments/Personal/EwwFi/eww"

eww -c "$CONFIG_DIR" daemon
eww -c "$CONFIG_DIR" update current="$(iwctl station wlan0 show | grep 'Connected network' | awk -F': ' '{print $2}')"
eww -c "$CONFIG_DIR" update networks="$(iwctl station wlan0 get-networks | awk '/SSID/ {print $2}' | jq -R -s -c 'split("\n")[:-1]')"
eww -c "$CONFIG_DIR" open wifiWindow


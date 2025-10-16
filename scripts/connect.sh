#!/bin/bash

SSID="$1"
PASSWORD="$2"

echo -e "$PASSWORD\n" | iwctl --passphrase "$PASSWORD" station wlan0 connect "$SSID"


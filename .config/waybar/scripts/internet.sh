#!/usr/bin/env bash
ping -c 1 -W 5 google.com &>/dev/null && echo "󰖩 Connected" || echo "󰖪 Disconnected"

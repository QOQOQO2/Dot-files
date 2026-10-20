#!/usr/bin/env bash

if ping -c 1 -W 5 google.com &>/dev/null; then
  echo "<span color='#87d2a6'>󰖩 </span>Connected"
else
  # check if any ethernet interface (en* or eth*) has an active carrier
  ethernet_plugged=0
  for d in /sys/class/net/en* /sys/class/net/eth*; do
    if [[ -f "$d/carrier" ]] && [[ "$(<"$d/carrier")" == "1" ]]; then
      ethernet_plugged=1
      break
    fi
  done

  if ((ethernet_plugged)); then
    # plugged in but no internet
    echo "<span color='#99A1C3'>󰖪 </span>Disconnected"
  else
    # not plugged in
    echo "<span color='#99A1C3'>󰈂 </span>Unplugged"
  fi
fi

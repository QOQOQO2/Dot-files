#!/usr/bin/env bash

# Script made by Livakivi on github

STATE_FILE="/tmp/hypr_gap_state"
WS=$(hyprctl activeworkspace -j | jq -r '.id')

# Read the current state (default to 0 if not found)
STATE=$(awk -v ws="$WS" '$1 == ws {print $2}' "$STATE_FILE" 2>/dev/null || echo 0)

if [[ "$STATE" == "1" ]]; then
    # Turn gaps off and rounding to 0 and remove shadow
    hyprctl keyword general:gaps_in 0
    hyprctl keyword general:gaps_out 0
    hyprctl keyword decoration:rounding 0
    hyprctl keyword decoration:shadow:enabled false
    # Update state
    sed -i "/^$WS /d" "$STATE_FILE"
    echo "$WS 0" >> "$STATE_FILE"
else
    # Turn gaps on and rounding to desired values and enable shadow
    hyprctl keyword general:gaps_in 3
    hyprctl keyword general:gaps_out 10
    hyprctl keyword decoration:rounding 2
    hyprctl keyword decoration:shadow:enabled true
    # Update state
    sed -i "/^$WS /d" "$STATE_FILE"
    echo "$WS 1" >> "$STATE_FILE"
fi


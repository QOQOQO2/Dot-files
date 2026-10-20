#!/usr/bin/env bash

choice="$(printf '%s\n' \
  "Wipe Clipboard" \
  "Clear .cache" | rofi -dmenu -p " ")"

case "$choice" in
"Wipe Clipboard")
  rm -f ~/.cache/cliphist/db
  ;;
"Clear .cache")
  rm -rf ~/.cache/*
  mkdir -p ~/.cache/nvim
  chmod 2770 ~/.cache/nvim
  chown $USER:users ~/.cache/nvim
  ;;
*)
  exit 0
  ;;
esac

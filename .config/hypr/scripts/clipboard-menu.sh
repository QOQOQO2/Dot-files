#!/usr/bin/env bash

choice="$(printf '%s\n' \
  "Wipe Clipboard" \
  "Show Clipboard History Count" \
  "Clear Fuzzel History" \
  "Clear Bemoji History" \
  "Clear .cache" \
  | fuzzel --dmenu)"

case "$choice" in
  "Wipe Clipboard")
    rm -f ~/.cache/cliphist/db
  ;;
  "Show Clipboard History Count")
    cliphist list | wc -l | fuzzel --dmenu --prompt "Entries:"
  ;;
  "Clear Fuzzel History")
    rm -f ~/.cache/fuzzel
  ;;
  "Clear Bemoji History")
    rm -f ~/.local/state/bemoji-history.txt
  ;;
  "Clear .cache")
    rm -rf ~/.cache/*
  ;;
  *)
    exit 0
  ;;
esac


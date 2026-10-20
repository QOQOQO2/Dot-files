#!/usr/bin/env bash

# make a temp file for the output
tmp_output=$(mktemp)
trap 'rm -f "$tmp_output"' EXIT

# stream output into terminal
"$@" -fdiagnostics-color=always 2>&1 | tee "$tmp_output"

exit_code=${PIPESTATUS[0]}

# strip the ascii codes
clean_output=$(sed -E 's/\x1B\[[0-9;]*[a-zA-Z]//g' "$tmp_output")

errors=$(echo "$clean_output" | grep -c -E "error:")
warnings=$(echo "$clean_output" | grep -c -E "warning:")
notes=$(echo "$clean_output" | grep -c -E "note:")

if [ "$exit_code" -eq 0 ]; then
  exit_clr="#[fg=green]"
else
  exit_clr="#[fg=red]"
fi

exit_fmt="Compilation${exit_clr}:exit [${exit_code}]#[default]"

status_str=" ${exit_fmt} [#[fg=red]${errors}#[default] #[fg=yellow]${warnings}#[default] #[fg=green]${notes}#[default]] #[fg=brightwhite]•"

# set the tmux status
if [ -n "$TMUX" ]; then
  tmux set -g @compilation_status "$status_str"
fi

exit $exit_code

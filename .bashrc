PS1='\[\e[1;34m\]\w \[\e[1;37m\]>\[\e[0;37m\] '

## nix profile thing ##
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

## Alias ##
alias clear='reset'
alias npl='nix profile list | grep Name: | sed "s/Name://g; s/ //g; s/\x1b\[[0-9;]*m//g"'
alias ncg='sudo nix-collect-garbage -d'
alias ff='fastfetch'
alias sudoe='sudo -E'
alias pubip='curl https://wtfismyip.com/text'
alias vislog='tail -f -n 10 /var/lib/webserver/visitor_log.txt'
alias webown='sudo chown -R webserver:webserver * && sudo chmod -R 750 *'
alias prism='nix-shell -p prismlauncher --run prismlauncher'

## Steam Stuff ##
alias terraria='steam-run ~/.local/share/Steam/steamapps/common/Terraria/Terraria'
alias tmodloader='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoader.sh'
alias tmodloaderserver='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoaderServer.sh'

## Functions ##

mc() {
  if [[ $# -eq 0 ]]; then
    cat <<'EOF'
Usage: mc <subcommand> [args...]
Subcommands:
  do <command...> Send command quietly to console
  say <message...> Send command and show what was sent
  log Tail live server logs
  watch <command...> Send command and tail logs immediately
  start Start the server
  stop Graceful stop
  restart Restart with countdown
  status Show systemd status
EOF
    return 1
  fi

  local subcmd="$1"
  shift
  local server_name="qoqoqo2-server"
  local unit="minecraft-server-${server_name}"
  local tmux_socket="/run/minecraft/${server_name}.sock"
  local tmux_target="0"

  case "$subcmd" in
    attach)
      tmux -S $tmux_socket attach -t $tmux_target
      ;;
    log)
      journalctl -u "$unit" -f
      ;;
    start)
      sudo systemctl start "$unit"
      echo "Started"
      ;;
    stop)
      sudo systemctl stop "$unit"
      echo "Stopped"
      ;;
    restart)
      sudo systemctl restart "$unit"
      echo "Restarted"
      ;;
    status)
      systemctl status "$unit" --no-pager
      ;;
    *)
      echo "Unknown: $subcmd"
      return 1
      ;;
  esac
}

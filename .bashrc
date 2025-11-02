PS1='\[\e[1;34m\]\w \[\e[1;37m\]>\[\e[0;37m\] '

# nix profile thing
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

alias clear='reset'

export TERMINAL=kitty

alias npl='nix profile list | grep Name: | sed "s/Name://g; s/ //g; s/\x1b\[[0-9;]*m//g"'

alias ncg='nix-collect-garbage'

alias ncgd='nix-collect-garbage -d'

alias ff='fastfetch'

## Steam stuff ##

alias terraria='steam-run ~/.local/share/Steam/steamapps/common/Terraria/Terraria'

alias tmodloader='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoader.sh'

## Zsh Options ##

PROMPT="%F{blue}%~ %F{white}>%f "
export TERMINAL=kittyX
setopt correct_all
autoload -Uz compinit
compinit

## Zsh Styles ##

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{blue}-- %d --%f'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=*'
zstyle ':completion:*' ignore-duplicates true
zstyle ':completion:*' special-dirs false

## nix profile thing ##
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

## Alias ##

alias clear='reset'
alias npl='nix profile list | grep Name: | sed "s/Name://g; s/ //g; s/\x1b\[[0-9;]*m//g"'
alias ncg='nix-collect-garbage'
alias ncgd='nix-collect-garbage -d'
alias ff='fastfetch'

## Steam Stuff ##

alias terraria='steam-run ~/.local/share/Steam/steamapps/common/Terraria/Terraria'
alias tmodloader='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoader.sh'
alias tmodloaderserver='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoaderServer.sh'

PS1='\[\e[1;34m\]\w \[\e[1;37m\]>\[\e[0;37m\] '

# nix profile thing
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

alias clear='reset'

export TERMINAL=kitty

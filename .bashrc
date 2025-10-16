PS1='\[\e[1;34m\]\w \[\e[1;37m\]>\[\e[0;37m\] '

# nix profile thing
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

alias clear='reset'

export TERMINAL=kitty

npl() {
  nix profile list \
    | grep Name: \
    | sed 's/Name://g' \
    | sed 's/ //g' \
    | sed 's/\x1b\[[0-9;]*m//g'
}

ncg() {
  nix-collect-garbage
}

ncgd() {
  nix-collect-garbage -d
}

ff() {
  fastfetch
}



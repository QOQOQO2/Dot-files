# vim: ft=zsh


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME=""

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
   git
   zsh-history-substring-search
   zsh-autosuggestions
   zsh-syntax-highlighting
   nix-shell
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

## Configuration ##

## Zsh Options ##
PROMPT="%F{blue}%~ %F{white}>%f "
export TERMINAL=kitty
export XDG_CONFIG_HOME="$HOME/.config"
setopt correct_all
autoload -Uz compinit
eval "$(starship init zsh)"

## Zsh Styles ##
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' group-name ''
zstyle ':completion:*' format '%F{blue}-- %d --%f'
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}' 'r:|=*' 'l:|=*'
zstyle ':completion:*' ignore-duplicates true
zstyle ':completion:*' special-dirs false

## nix profile thing ##
# if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
#   source ~/.nix-profile/etc/profile.d/nix.sh
# fi

# historu substring search bindkey
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Envi vars #
export MANPAGER="nvim +Man\!"

## Alias ##
alias clear='reset'
alias npl='nix profile list | grep Name: | sed "s/Name://g; s/ //g; s/\x1b\[[0-9;]*m//g"'
#alias ncg='doas nix-collect-garbage >/dev/null 2>&1 && echo "done :D" || echo "faild D:"'
#alias ncgd='doas nix-collect-garbage -d >/dev/null 2>&1 && echo "done :D" || echo "faild D:"'
alias ncg='doas nix-collect-garbage'
alias ncgd='doas nix-collect-garbage -d'
alias ff='fastfetch'
alias sudo='doas'
alias pubip='curl -fsSL https://myip.wtf/text'
alias comp='cat ./comp.gcc | zsh'
alias svim='doas nvim'
alias fixnvimcache='doas chown $(echo $USER):users ~/.cache/nvim/* -R'
#alias nixrebuild='doas nixos-rebuild switch'
#alias homeswitch='nix run home-manager -- switch --flake ~/Flakes'
#alias homeswitch='home-manager switch --flake ~/Flakes'
#alias homeupdate='nix flake update --flake ~/Flakes'
alias homenews='home-manager news'
alias nixedit='svim ~/Flakes/sys/* && ask "Do you want to rebuild?" && nixrebuild'
alias hypredit='nvim ~/.config/hypr/*(N.) ~/.config/hypr/hyprland-config/*(N.) && hyprctl reload'
alias zshedit='nvim ~/.zshrc && source ~/.zshrc'
alias rustc='cargo check'
alias rustr='cargo run'
alias rustb='cargo build --release'
alias rustw='cargo watch -x run'
alias icat='kitten icat'

## Steam Stuff ##
alias terraria='steam-run ~/.local/share/Steam/steamapps/common/Terraria/Terraria'
alias terrariaserver='steam-run ~/.local/share/Steam/steamapps/common/Terraria/TerrariaServer'
alias tmodloader='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoader.sh'
alias tmodloaderserver='steam-run ~/.local/share/Steam/steamapps/common/tModLoader/start-tModLoaderServer.sh'

## Functions ##

ask() {
    read -q "response?${1} (y/n) "
    echo
    if [[ "$response" =~ ^[Yy]$ ]]; then
        return 0
    else
        return 1
    fi
}

homeedit() {
  nvim ~/Flakes/*(N.)
    if ask "Do you want to update?"; then
        homeupdate
        return 0
    fi
    if ask "Do you want to switch?"; then
        homeswitch
    fi
}

storename() {
  readlink -e $(which ${1})
}

nixrebuild() {
  cd /home/qoqoqo2/Flakes || return 1
  git add .

  if doas nixos-rebuild switch --flake /home/qoqoqo2/Flakes/sys#hypr; then
    local gen=$(doas nixos-rebuild list-generations | grep 'True$' | awk '{print $1}')    

    git commit -m "System Rebuild #$gen at $(date '+%Y-%m-%d %H:%M:%S')"
    timeout 5s git push origin main || echo "Offline, commit saved locally."
    return 0
  else
    echo "System build failed. No commit made."
    return 1
  fi
}

homeswitch() {
  cd /home/qoqoqo2/Flakes || return 1
  git add . 

  if home-manager switch -b backup --flake /home/qoqoqo2/Flakes#qoqoqo2; then
    local gen=$(home-manager generations | head -n 1 | awk '{print $5}')
    
    git commit -m "Home Rebuild #$gen at $(date '+%Y-%m-%d %H:%M:%S')"
    timeout 5s git push origin main || echo "Offline, commit saved locally."
    zsh
    return 0
  else
    echo "Home Manager build failed. No commit made."
    return 1
  fi
}

homeupdate() {
  cd /home/qoqoqo2/Flakes || return 1
  if nix flake update; then
    homeswitch
  else
    echo "Flake update failed."
    return 1
  fi
}

## Plugin Override ##
ZSH_HIGHLIGHT_STYLES[comment]='fg=#636DA4'

source ~/.zshprivate

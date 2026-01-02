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
if [ -e ~/.nix-profile/etc/profile.d/nix.sh ]; then
  source ~/.nix-profile/etc/profile.d/nix.sh
fi

# historu substring search bindkey
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

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
  attach Attaches to the server via tmux
  log Prints the logs
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

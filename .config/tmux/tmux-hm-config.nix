{
  pkgs,
  ...
}:
{
  home.file = {
    ".local/bin/gcc" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        exec "$HOME/.config/tmux/tmux-gcc.sh" "${pkgs.gcc}/bin/gcc" "$@"
      '';
    };

    ".local/bin/g++" = {
      executable = true;
      text = ''
        #!/usr/bin/env bash
        exec "$HOME/.config/tmux/tmux-gcc.sh" "${pkgs.gcc}/bin/g++" "$@"
      '';
    };
  };

  programs = {
    tmux = {
      enable = true;
      clock24 = true;
      newSession = true;
      mouse = true;

      secureSocket = false;

      keyMode = "vi";
      shortcut = "q";
      baseIndex = 1;

      escapeTime = 0;
      historyLimit = 25000;

      plugins = with pkgs.tmuxPlugins; [
        catppuccin
        sensible
        resurrect
        continuum
      ];

      extraConfig = ''
        # https://old.reddit.com/r/tmux/comments/mesrci/tmux_2_doesnt_seem_to_use_256_colors/
        # set -g default-terminal "xterm-256color"
        set -g default-terminal "tmux-256color"
        set -ga terminal-overrides ",*256col*:Tc"
        set -ga terminal-overrides '*:Ss=\E[%p1%d q:Se=\E[ q'
        set-environment -g COLORTERM "truecolor"

        # status
        set -g status-style bg=default
        set -g status-left-length 50
        set -g status-left "#[fg=blue][#S] #[fg=brightwhite]• " 
        set -g status-right-length 50
        set -g status-right "#{@compilation_status}#[fg=brightcyan] %H:%M #[fg=brightwhite]•#[fg=brightcyan] %d-%b-%y"

        #continuum
        set -g @continuum-save-interval '7'
        set -g @continuum-restore 'on'

        # cat
        set -g @catppuccin_window_text " #W (#{b:pane_current_path})"
        set -g @catppuccin_window_current_text " #W (#{b:pane_current_path})"
        set-hook -g after-new-session "source-file ~/.config/tmux/tmux.conf"

        # easy-to-remember split pane commands
        bind | split-window -h -c "#{pane_current_path}"
        bind - split-window -v -c "#{pane_current_path}"
        bind c new-window -c "#{pane_current_path}"

        # update mouse drag behavior to copy to system clipboard
        bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "wl-copy"
      '';
    };
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "mauve";

    tmux.enable = false;
  };
}

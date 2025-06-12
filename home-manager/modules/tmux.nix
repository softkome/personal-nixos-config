{ pkgs, lib, config, ... }: {
    
  options = {
    tmuxMod.enable = lib.mkEnableOption "enables tmuxMod";
  };

  config = lib.mkIf config.tmuxMod.enable {
    programs.tmux = {
      enable = true;
      baseIndex = 1;
      mouse = true;
      escapeTime = 0;
      keyMode = "vi";
      terminal = "screen-256color";
  
      extraConfig = ''
        set -as terminal-features ",alacritty*:RGB"
        # Reload config
        bind -n M-r source-file ~/.config/tmux/tmux.conf \; display "Reloaded!"
  
        # Pane and window controls
        bind C-p previous-window
        bind C-n next-window
        bind -n M-1 select-window -t 1
        bind -n M-2 select-window -t 2
        bind -n M-3 select-window -t 3
        bind -n M-4 select-window -t 4
        bind -n M-5 select-window -t 5
        bind -n M-6 select-window -t 6
        bind -n M-7 select-window -t 7
        bind -n M-8 select-window -t 8
        bind -n M-9 select-window -t 9
  
        bind -n M-Left select-pane -L
        bind -n M-Right select-pane -R
        bind -n M-Up select-pane -U
        bind -n M-Down select-pane -D
  
        bind -n M-S-Left resize-pane -L 5
        bind -n M-S-Right resize-pane -R 5
        bind -n M-S-Up resize-pane -U 3
        bind -n M-S-Down resize-pane -D 3
  
        bind -n M-s split-window -v
        bind -n M-v split-window -h
  
        bind -n M-o new-window -c "/etc/nixos/"
        bind -n M-Enter new-window
        bind -n M-c kill-pane
        bind -n M-q kill-window
        bind -n M-Q kill-session
  
        ### 🟩 Starship-style visual theming
  
        # General status bar
        set -g status on
        set -g status-interval 1
        set -g status-justify left
        set -g status-style bg=default,fg=default
  
        # Left: ▉ user ▉ host (inverted-style blocks)
        set -g status-left-length 100
        set -g status-left "#[bg=colour237,fg=default]▉ #(whoami) #[reverse]#[bg=colour237,fg=default]▉ #H "
  
  
  
        # Right: ▉ time ▉ session name
        set -g status-right-length 100
        set -g status-right "#[bg=colour237,fg=default]▉ #[bg=colour237,fg=default]%Y-%m-%d %H:%M #[reverse]#[bg=colour237,fg=default] #S "
  
        # Current window: highlighted block
        setw -g window-status-current-format "#[bg=colour237,fg=default]▉ #[bg=colour237,fg=default]#I:#W #[reverse]#[bg=colour237,fg=default]"
  
        # Inactive windows: simple gray
        setw -g window-status-format "#[bg=default,fg=grey] #I:#W "
        setw -g window-status-separator ""
      '';
  
      plugins = with pkgs; [
        # tmuxPlugins.gruvbox
        # Uncomment if using session persistence
        # {
        #   plugin = tmuxPlugins.resurrect;
        #   extraConfig = "set -g @resurrect-strategy-nvim 'session'";
        # }
        # {
        #   plugin = tmuxPlugins.continuum;
        #   extraConfig = ''
        #     set -g @continuum-restore 'on'
        #     set -g @continuum-save-interval '60'
        #   '';
        # }
      ];
    };
  };
}


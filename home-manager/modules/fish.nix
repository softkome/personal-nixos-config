{ lib, config, ... }: {

  options = {
    fishMod = lib.mkEnableOption "enables fishMod";
  };
    
  config = lib.mkIf config.fishMod {
    programs.fish = {
      enable = true;
      shellInit = ''
        set -g fish_greeting ""
  
        alias r = "ranger"
	      alias v = "nvim"
	      alias se = "sudoedit"
	      alias microfetch = "command microfetch; echo"
	      alias .. = "cd .."
	      alias hm = "cd /etc/nixos/home-manager/modules/"
	      alias nx = "cd /etc/nixos/"
	      alias c = "clear"

        # Start Tmux automatically if not already running. No Tmux in TTY
        if test -z "$TMUX" -a -n "$DISPLAY"
          tmux attach-session -t default; or tmux new-session -s default
        end
  
        # Start UWSM (adjust command if needed for Fish syntax)
        if uwsm check may-start > /dev/null && uwsm select
          exec systemd-cat -t uwsm_start uwsm start default
        end
      '';
    };
  };
}

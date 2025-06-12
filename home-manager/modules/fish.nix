{ lib, config, ... }: {

  options = {
    fishMod = lib.mkEnableOption "enables fishMod";
  };
    
  config = lib.mkIf config.fishMod {
    programs.fish = {
      enable = true;
      shellInit = ''
        # Disable the Fish greeting
        set -g fish_greeting ""
  
        # Aliases (Functions in Fish)
  
        function r
          ranger $argv
        end
  
        function v
          nvim $argv
        end
  
        function se
          sudoedit $argv
        end
  
        function microfetch
          command microfetch; echo
        end
  
        function gs
          git status $argv
        end
  
        function ga
          git add $argv
        end
  
        function gc
          git commit $argv
        end
  
        function gp
          git push $argv
        end
  
        function ..
          cd .. $argv
        end
  
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

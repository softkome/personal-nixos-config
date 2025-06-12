{ lib, config, ...}: {

  options = {
    starshipMod.enable = lib.mkEnableOption "enables starshipMod";
  };

  config = lib.mkIf config.starshipMod.enable {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;
      settings = {
        add_newline = true;
  
        format = "$username$hostname$directory$git_branch$character";
  
        username = {
          show_always = true;
          format = "[▉](bg:background fg:none)[(bg:background fg:none) $user ](inverted)";
          style_user = "bg:background fg:none";
        };
  
        hostname = {
          ssh_only = false;
          format = "[▉](bg:background fg:none)[(bg:background fg:none) $hostname ](inverted)";
          style = "bg:background fg:none";
        };
  
        directory = {
          format = "[▉](bg:background fg:none)[(bg:background fg:none) $path ](inverted)$read_only";
          style = "bg:background fg:none";
          read_only = " 🔒";
          truncation_symbol = "…/";
        };
  
        git_branch = {
          format = "[▉](bg:background fg:none)[(bg:background fg:none) \ue725 $branch ](inverted)";
          style = "bg:background fg:none";
        };
  
        character = {
          success_symbol = "[ & ](green bold)";
          error_symbol = "[ & ](red)";
          vicmd_symbol = "[ & ](yellow)";
        };
      };
    };
  };
}


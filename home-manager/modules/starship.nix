{ lib, config, ...}: {

  options = {
    starshipMod.enable = lib.mkEnableOption "enables starshipMod";
  };

  config = lib.mkIf config.starshipMod.enable {
    programs.starship = {
      enable = true;
      enableFishIntegration = true;
      settings = {
        add_newline = false;
  
        format = "$directory$git_branch$character";

        directory = {
          read_only = " [R]";
	  truncation_length = 2;
          truncation_symbol = "…/";
	  substitutions = {
	    "/etc/nixos/home-manager/modules" = "home";
	    "/etc/nixos" = "nixos";
	  };
        };
      };
    };
  };
}




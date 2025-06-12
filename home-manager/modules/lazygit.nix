{ lib, config, ...}: {

  options = {
    lazygitMod.enable = lib.mkEnableOption "enables lazygitMod";
  };

  config = lib.mkIf config.lazygitMod.enable {
    programs.lazygit = {
      enable = true;
      settings = {
        gui.showIcons = true;
        gui.theme = {
          lightTheme = false;
          activeBorderColor = [ "green" "bold" ];
          inactiveBorderColor = [ "grey" ];
          selectedLineBgColor = [ "blue" ];
        };
      };
    };
  };
}

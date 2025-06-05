{ config, ... }:

{
  home.sessionVariables = {
    TERMINAL = "alacritty";
    EDITOR = "nvim";
    XDG_BIN_HOME = "${config.home.homeDirectory}/.local/bin";
    PATH = "${config.home.homeDirectory}/.local/bin:$PATH";
  };
}

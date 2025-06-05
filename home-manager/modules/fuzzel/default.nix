{ config, pkgs, ... }:

{
  home.packages = [
    pkgs.fuzzel
  ];

  xdg.configFile."fuzzel/fuzzel.ini" = {
    source = ./fuzzel.ini;
  };
}

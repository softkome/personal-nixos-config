{ pkgs, inputs, lib, config, ... }: {

  options = {
    stylixMod = lib.mkEnableOption "enables stylixMod";
  };

  config = lib.mkIf config.stylixMod { 
    home.packages = with pkgs; [
      dejavu_fonts
      jetbrains-mono
      noto-fonts
      noto-fonts-lgc-plus
      texlivePackages.hebrew-fonts
      noto-fonts-emoji
      font-awesome
      powerline-fonts
      powerline-symbols
      pkgs.nerd-fonts.symbols-only
    ];
  
    stylix = {
      enable = true;
      polarity = "dark";
      base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-medium.yaml";
  
     
      targets = {
        neovim.enable = false;
        waybar.enable = false;
        wofi.enable = false;
        hyprland.enable = false;
        hyprlock.enable = false;
        mako.enable = false;
      };
  
      cursor = {
        name = "Bibata-Modern-Ice";
        size = 20;
        package = pkgs.bibata-cursors;
      };
  
      fonts = {
        emoji = {
          name = "Noto Color Emoji";
          package = pkgs.noto-fonts-color-emoji;
        };
        monospace = {
          name = "JetBrains Mono";
          package = pkgs.jetbrains-mono;
        };
        sansSerif = {
          name = "Noto Sans";
          package = pkgs.noto-fonts;
        };
        serif = {
          name = "Noto Serif";
          package = pkgs.noto-fonts;
        };
  
        sizes = {
          terminal = 13;
          applications = 11;
        };
      };
  
      iconTheme = {
        enable = true;
        package = pkgs.papirus-icon-theme;
        dark = "Papirus-Dark";
        light = "Papirus-Light";
      };
  
      image = ./themes/mikuwallpaper.jpg;
        
    };
  };
}

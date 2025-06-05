{ config, pkgs, inputs, user, hostname, homeStateVersion, ... }:

{
  imports = [
    ./local-packages.nix
    ./hardware-configuration.nix
    ../../system-modules
    inputs.home-manager.nixosModules.default
  ];

  networking.hostName = hostname;

  time.timeZone = "Europe/London";

  i18n = {
    defaultLocale = "en_GB.UTF-8";
    extraLocaleSettings = {
      LC_ALL = "en_GB.UTF-8";
    };
  };

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    extraSpecialArgs = {
      inherit inputs user homeStateVersion;
    };

    users.${user} = import ../../home-manager/home.nix;
  };

  system.stateVersion = "24.11";
}

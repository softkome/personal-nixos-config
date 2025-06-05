{ user, homeStateVersion, ... }:

{
  imports = [
    ./home-packages.nix
    ./modules
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";
    stateVersion = homeStateVersion;
  };

  home.sessionVariables = {
    
  };
}

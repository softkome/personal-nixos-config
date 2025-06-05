{ inputs, user, homeStateVersion, ... }: {
  home-manager = {
    extraSpecialArgs = {
      inherit inputs user homeStateVersion;
    };

    users.${user} = import ../home-manager/home.nix;
  };
}

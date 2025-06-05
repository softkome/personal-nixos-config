{ config, pkgs, ... }:

{
  xdg.mime.defaultApplications = {
    "inode/directory" = "ranger";
  };
}

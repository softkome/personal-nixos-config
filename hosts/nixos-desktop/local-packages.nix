{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    vim  # text editor
    pulseaudio  # for pactl CLI usage
  ];
}

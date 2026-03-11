{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];

  networking.hostName = "victor";

  # Gaming
  programs.steam.enable = true;
  programs.gamemode.enable = true;
}

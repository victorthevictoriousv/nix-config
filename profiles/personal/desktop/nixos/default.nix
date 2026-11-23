{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./cooling.nix
    ./gaming.nix
    ./creative.nix
  ];

  networking.hostName = "victor";

  # Gaming
  programs.steam = {
    enable = true;
    remotePlay.openFirewall = true;
    extraCompatPackages = [ pkgs.proton-ge-bin ];
  };
  programs.gamemode.enable = true;
  hardware.steam-hardware.enable = true;
}

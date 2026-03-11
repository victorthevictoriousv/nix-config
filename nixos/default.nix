{ ... }:

{
  imports = [
    ./boot.nix
    ./locale.nix
    ./desktop.nix
    ./audio.nix
    ./hardware.nix
    ./users.nix
  ];

  # Networking
  networking.networkmanager.enable = true;

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Nix settings
  nix = {
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
      auto-optimise-store = true;
    };
    gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 30d";
    };
  };

  system.stateVersion = "25.11";
}

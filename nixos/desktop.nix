{ pkgs, ... }:

{
  services = {
    # GNOME Desktop Environment
    displayManager = {
      gdm.enable = true;
      autoLogin.enable = true;
      autoLogin.user = "victor";
    };
    desktopManager.gnome.enable = true;

    # Printing
    printing.enable = true;
  };

  # Fonts
  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
  ];
}

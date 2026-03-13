{ ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/vscode.nix
    ./modules/git.nix
    ./modules/gnome.nix
  ];

  home.stateVersion = "25.11";
}

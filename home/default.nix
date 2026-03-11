{ ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/vscode.nix
  ];

  home.stateVersion = "25.11";
}

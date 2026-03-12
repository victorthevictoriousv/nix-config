{ ... }:
{
  imports = [
    ./modules/zsh.nix
    ./modules/vscode.nix
    ./modules/git.nix
  ];

  home.stateVersion = "25.11";
}

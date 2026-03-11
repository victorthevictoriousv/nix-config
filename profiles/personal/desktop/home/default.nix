{ pkgs, ... }:
{
  modules = {
    # Development tools
    vscode.enable = true;

    # Terminal and shell
    zsh.enable = true;
  };

  home.packages = with pkgs; [
    claude-code
    discord
    google-chrome
  ];
}

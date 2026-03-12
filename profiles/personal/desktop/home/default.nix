{ pkgs, ... }:
{
  modules = {
    # Development tools
    vscode.enable = true;

    # Terminal and shell
    zsh.enable = true;

    # Version control
    git.enable = true;
  };

  home.packages = with pkgs; [
    claude-code
    discord
    google-chrome
    _1password-gui
  ];
}

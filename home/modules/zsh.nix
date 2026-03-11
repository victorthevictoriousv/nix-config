{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.zsh;
in
{
  options.modules.zsh.enable = lib.mkEnableOption "zsh";

  config = lib.mkIf cfg.enable {
    programs.zsh = {
      enable = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;
      oh-my-zsh = {
        enable = true;
        theme = "robbyrussell";
        plugins = [
          "git"
          "z"
          "sudo"
          "history"
        ];
      };
      shellAliases = {
        ll = "ls -la";
      };
    };

    programs.fzf = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}

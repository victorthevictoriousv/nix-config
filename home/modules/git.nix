{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.git;
in
{
  options.modules.git.enable = lib.mkEnableOption "git";

  config = lib.mkIf cfg.enable {
    programs.git = {
      enable = true;
      userName = "victor";
      userEmail = "victorthevictoriousv@gmail.com";
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}

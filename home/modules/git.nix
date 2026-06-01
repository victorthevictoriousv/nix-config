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
      settings = {
        user.name = "victor";
        user.email = "victorthevictoriousv@gmail.com";
        init.defaultBranch = "main";
        pull.rebase = true;
      };
    };
  };
}

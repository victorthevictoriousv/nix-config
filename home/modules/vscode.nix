{
  config,
  lib,
  ...
}:
let
  cfg = config.modules.vscode;
in
{
  options.modules.vscode.enable = lib.mkEnableOption "vscode";

  config = lib.mkIf cfg.enable {
    programs.vscode = {
      enable = true;
    };
  };
}

{ pkgs, ... }:

{
  environment.systemPackages = [
    pkgs.kdePackages.kdenlive
  ];

  # Kdenlive (Qt) auto-loads the gtk3 platform theme under GNOME, which needs
  # org.gtk.Settings.FileChooser. GNOME 50's session only ships gtk4 schemas in
  # XDG_DATA_DIRS, so without this kdenlive hard-aborts (SIGABRT) when opening
  # a file dialog. GSETTINGS_SCHEMA_DIR points glib straight at gtk3's compiled schemas.
  environment.sessionVariables.GSETTINGS_SCHEMA_DIR =
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}/glib-2.0/schemas";
}

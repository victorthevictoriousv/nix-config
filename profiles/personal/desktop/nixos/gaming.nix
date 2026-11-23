{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    mangohud   # FPS/GPU/CPU in-game overlay
    gamescope  # Wayland gaming compositor for better fullscreen handling
    corectrl   # AMD GPU overclocking/tuning GUI
  ];
}

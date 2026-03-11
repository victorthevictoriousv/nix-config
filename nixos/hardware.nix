{ pkgs, ... }:

{
  # GPU and Vulkan support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Firmware and AMD microcode updates
  hardware.enableRedistributableFirmware = true;

  # CPU governor — performance mode for desktop
  powerManagement.cpuFreqGovernor = "performance";

  # Zram compressed swap
  zramSwap.enable = true;

  # SSD periodic TRIM
  services.fstrim.enable = true;
}

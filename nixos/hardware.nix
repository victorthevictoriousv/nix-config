{ pkgs, ... }:

{
  # GPU and Vulkan support
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # ROCm/OpenCL for AMD GPU (required by DaVinci Resolve)
  hardware.amdgpu.opencl.enable = true;

  # Firmware and AMD microcode updates
  hardware.enableRedistributableFirmware = true;

  # CPU governor — performance mode for desktop
  powerManagement.cpuFreqGovernor = "performance";

  # Zram compressed swap
  zramSwap.enable = true;

  # SSD periodic TRIM
  services.fstrim.enable = true;
}

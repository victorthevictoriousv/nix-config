{ pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 10;
      efi.canTouchEfiVariables = true;
    };

    # Latest kernel for RDNA 4 (RX 9060 XT) support
    kernelPackages = pkgs.linuxPackages_latest;

    # Unlock all AMD GPU power management features
    kernelParams = [ "amdgpu.ppfeaturemask=0xffffffff" ];
  };
}

# Dummy hardware-configuration for evaluation purposes.
# Replace with actual hardware-configuration.nix from nixos-generate-config.
_:
{
  fileSystems."/" = {
    device = "/dev/disk/by-label/nixos";
    fsType = "ext4";
  };
  boot.initrd.availableKernelModules = [ ];
}

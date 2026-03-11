# nix-config

NixOS desktop configuration using Nix flakes.

## Hosts

| Host | System | Platform |
| --- | --- | --- |
| `personal-desktop` | NixOS (GNOME) | x86_64-linux |

## Initial setup

```bash
# Get git
nix-shell -p git

# Clone the repo
git clone https://github.com/mtnptrsn/victor-nix-config.git ~/Code/nix-config
cd ~/Code/nix-config

# Copy hardware configuration
cp /etc/nixos/hardware-configuration.nix profiles/personal/desktop/nixos/

# Add hardware configuration to git
git add profiles/personal/desktop/nixos/hardware-configuration.nix

# Apply
sudo nixos-rebuild switch --flake .#personal-desktop
```

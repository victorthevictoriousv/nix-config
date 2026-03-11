{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }:
    let
      mkHost =
        hostName:
        nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            ./nixos
            ./profiles/${hostName}
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                backupFileExtension = "bak";
                users.victor = {
                  imports = [
                    ./home
                    ./profiles/${hostName}/home
                  ];
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        personal-desktop = mkHost "personal/desktop";
      };
    };
}

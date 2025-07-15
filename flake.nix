{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://nix-community.cachix.org"
    ];

    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];
  };

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    niri.url = "github:sodiboo/niri-flake";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence/home-manager-v2";
  };

  outputs = inputs@{ nixpkgs, home-manager, niri, impermanence, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        # Host configuration
        ./hosts/nixos

        # Core modules
        ./modules/niri.nix
        ./modules/system.nix
        ./modules/greetd.nix
        ./modules/persist.nix
        ./modules/proxy.nix
        ./modules/snapper.nix
        ./modules/nvidia.nix

        # External modules
        niri.nixosModules.niri
        impermanence.nixosModules.impermanence

        # Home manager configuration
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.wendster = import ./home;
          };
        }
      ];
    };
  };
}

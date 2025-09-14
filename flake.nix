{
  description = "NixOS configuration";

  nixConfig = {
    extra-substituters = [
      "https://niri.cachix.org"
    ];

    extra-trusted-public-keys = [
      "niri.cachix.org-1:Wv0OmO7PsuocRKzfDoJ3mulSl7Z6oezYhGhR+3W2964="
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

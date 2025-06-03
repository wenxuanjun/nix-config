{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    impermanence.url = "github:nix-community/impermanence/home-manager-v2";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, niri, impermanence, ... }: {
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
        ./modules/snapper.nix

        # External modules
        nur.modules.nixos.default
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

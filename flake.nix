{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    niri.url = "github:sodiboo/niri-flake";
    nur.url = "github:nix-community/NUR";
    nur.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, nur, niri, ... }: {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [
        # Host configuration
        ./hosts/nixos

        # Core modules
        ./modules/niri.nix
        ./modules/system.nix
        ./modules/greetd.nix

        # External modules
        nur.modules.nixos.default
        niri.nixosModules.niri

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

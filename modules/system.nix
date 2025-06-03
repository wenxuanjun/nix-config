{ config, lib, pkgs, ... }:

{
  # Enable experimental features for flakes
  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];

    experimental-features = [ "nix-command" "flakes" ];
  };

  # Core system packages available to all users
  environment.systemPackages = with pkgs; [
    git
    micro
    fd
    ripgrep
  ];

  # Allow installation of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable services for better file manager functionality
  services.gvfs.enable = true;
  services.tumbler.enable = true;
}

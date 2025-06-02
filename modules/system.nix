{ config, lib, pkgs, ... }:

{
  # Enable experimental features for flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
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

  # Enable fuse userAllowOther for home-manager impermanence
  programs.fuse.userAllowOther = true;
}

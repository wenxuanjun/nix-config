# Basic system configuration for NixOS
# This module contains core system settings like Nix configuration, package management,
# and basic system packages.

{ config, lib, pkgs, ... }:

{
  # Enable experimental features for flakes
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
    ];
  };

  # Allow installation of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Core system packages available to all users
  environment.systemPackages = with pkgs; [
    git
    micro
    fd
    ripgrep
  ];
}
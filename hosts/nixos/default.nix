# NixOS host configuration
# This is the main configuration file for this specific host.

{ config, lib, pkgs, ... }:

{
  imports = [
    # Include the hardware configuration
    ./hardware.nix
  ];

  # Use the systemd-boot EFI boot loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel
  boot.kernelPackages = pkgs.linuxPackages_latest;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set time zone
  time.timeZone = "Asia/Shanghai";

  # Define user account
  users.users.wendster = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    hashedPasswordFile = "/persist/secrets/wendster";
  };

  # Disable mutable users for impermanence
  users.mutableUsers = false;

  # Configure sudo to not require password for wheel group
  security.sudo.wheelNeedsPassword = false;

  # Enable OpenSSH daemon
  services.openssh.enable = true;

  # This value determines the NixOS release with which your system is to be
  # compatible, in order to avoid breaking some software.
  system.stateVersion = "25.11";
}

# Impermanence configuration for NixOS
# This module configures which files and directories should persist across reboots
# when using an impermanent root filesystem.

{ config, lib, pkgs, ... }:

{
  # Configure impermanence
  environment.persistence."/persist" = {
    hideMounts = true;

    # System directories that need to persist
    directories = [
      # System configuration and state
      "/etc/nixos"
      "/etc/NetworkManager/system-connections"
      "/etc/ssh"

      # System logs and state
      "/var/log"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/var/lib/NetworkManager"
    ];

    # Individual files that need to persist
    files = [
      # Machine ID
      "/etc/machine-id"

      # SSH host keys
      "/etc/ssh/ssh_host_ed25519_key"
      "/etc/ssh/ssh_host_ed25519_key.pub"
      "/etc/ssh/ssh_host_rsa_key"
      "/etc/ssh/ssh_host_rsa_key.pub"
    ];
  };

  # Ensure the persistent directory exists and has correct permissions
  systemd.tmpfiles.rules = [
    "d /persistent 0755 root root -"
    "d /persistent/home 0755 root root -"
    "d /persistent/home/wendster 0750 wendster users -"
  ];

  # Optional: Configure automatic cleanup of temporary files
  boot.tmp.cleanOnBoot = true;
}

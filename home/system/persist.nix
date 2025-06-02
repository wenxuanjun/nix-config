# Home-manager impermanence configuration
# This module configures which user files and directories should persist across reboots

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/persist" = {
    directories = [
      # User directories
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Projects"

      # Security and authentication
      {
        directory = ".ssh";
        mode = "0700";
      }

      # Application data
      ".mozilla"
      ".config/QQ"

      # Cache directories
      ".cache/nix"

      # System directories that may contain user data
      ".local/share/keyrings"
      ".local/share/zed"
    ];

    files = [
      # Shell configuration
      ".bash_history"
    ];
  };
}

{ config, lib, pkgs, inputs, ... }:

{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/persist" = {
    hideMounts = true;

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
      ".local/share/mcfly"
      ".local/share/nix"
      ".local/share/zed"
    ];

    files = [
      # Shell configuration
      ".bash_history"
    ];
  };
}

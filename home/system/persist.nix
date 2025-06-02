# Home-manager impermanence configuration
# This module configures which user files and directories should persist across reboots

{ config, lib, pkgs, ... }:

{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ]

  home.persistence."/persist/home/wendster" = {
    directories = [
      # User directories
      "Downloads"
      "Music"
      "Pictures"
      "Documents"
      "Videos"
      "Projects"

      # Configuration directories
      ".config"
      ".local"
      ".cache"

      # Security and authentication
      {
        directory = ".ssh";
        mode = "0700";
      }
      {
        directory = ".gnupg";
        mode = "0700";
      }

      # Application data
      ".mozilla"
      ".steam"

      # System directories that may contain user data
      ".local/share/keyrings"
      ".local/share/direnv"
      ".local/share/zoxide"
      ".local/share/fish"
      ".local/share/nix"
    ];

    files = [
      # Shell configuration
      ".bashrc"
      ".zshrc"
      ".profile"
      ".bash_profile"
      ".bash_history"

      # Git configuration
      ".gitconfig"
      ".gitignore_global"

      # Editor configurations
      ".vimrc"
      ".nanorc"

      # Application configurations that are files
      ".screenrc"
      ".tmux.conf"

      # Optional: Application-specific files
      # ".wakatime.cfg"
    ];

    # Allow other users (like root) to access files through bind mounts
    # Useful for sudo operations, Docker, etc.
    allowOther = true;
  };

  # Note: Make sure to enable programs.fuse.userAllowOther = true in your NixOS configuration
  # for allowOther to work properly
}

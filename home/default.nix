{ config, lib, pkgs, ... }:

{
  # User information
  home.username = "wendster";
  home.homeDirectory = "/home/wendster";
  # home.language.base = "zh_CN.UTF-8";

  # Import all modules
  imports = [
    # Core
    ./packages.nix

    # System Configuration
    ./system/services.nix
    ./system/fcitx5.nix
    ./system/theming.nix
    ./system/xdg.nix
    ./system/git.nix
    ./system/ssh.nix
    ./system/shell.nix
    ./system/persist.nix

    # Desktop Environment
    ./desktop/niri.nix
    ./desktop/waybar.nix
    ./desktop/swaync.nix
    ./desktop/fuzzel.nix

    # Applications
    ./apps/firefox.nix
    ./apps/gnome-terminal.nix
    ./apps/zed-editor.nix
  ];

  # State version
  home.stateVersion = "25.11";
}

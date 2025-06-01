# Packages module for user environment
# This module manages the packages installed in the user's environment

{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    # Fonts
    source-han-sans
    nerd-fonts.sauce-code-pro

    # Wayland utilities
    xwayland-satellite-unstable
    swaybg

    # Multimedia
    qq
    obs-studio
    loupe

    # System utilities
    fastfetch
    imagemagick
    pavucontrol

    # File management
    xfce.thunar
    xfce.thunar-volman
  ];
}

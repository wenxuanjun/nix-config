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
    htop
    imagemagick
    pavucontrol
    seahorse
    file-roller

    # File management
    (xfce.thunar.override {
      thunarPlugins = [
        xfce.thunar-volman
        xfce.thunar-archive-plugin
      ];
    })
  ];
}

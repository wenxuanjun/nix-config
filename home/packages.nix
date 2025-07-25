{ pkgs, ... }:

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
    celluloid
    ffmpeg

    # System utilities
    imagemagick
    pavucontrol
    seahorse
    file-roller

    # Programming
    nixd
    scc

    # File management
    (xfce.thunar.override {
      thunarPlugins = [
        xfce.thunar-volman
        xfce.thunar-archive-plugin
      ];
    })
  ];
}

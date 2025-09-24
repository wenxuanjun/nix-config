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
    nautilus
    imagemagick
    pavucontrol
    seahorse
    file-roller

    # Programming
    nixd
    scc
  ];
}

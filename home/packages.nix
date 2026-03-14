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
    wechat
    obs-studio
    loupe
    celluloid
    ffmpeg
    libreoffice-fresh

    # System utilities
    nemo
    pavucontrol
    seahorse
    file-roller

    # Programming
    nixd
    scc

    # Thumbnailer
    gdk-pixbuf
    ffmpegthumbnailer
  ];
}

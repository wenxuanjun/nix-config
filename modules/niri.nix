# Niri Window Manager Module
# Sets up Niri, a simple but featureful Wayland compositor

{ config, lib, pkgs, inputs, ... }:

{
  # Enable Niri window manager
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Apply the niri overlay to get access to the latest unstable version
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
}

{ pkgs, inputs, ... }:

{
  # Enable Niri window manager
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
  };

  # Disable default kde polkit agent
  systemd.user.services.niri-flake-polkit.enable = false;

  # Apply the niri overlay to get access to the latest unstable version
  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
}

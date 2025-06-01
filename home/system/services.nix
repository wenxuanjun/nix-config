# System services module
# This module configures user-level systemd services for the desktop environment

{ config, lib, pkgs, ... }:

{
  # Wallpaper
  services.wpaperd = {
    enable = true;
    settings.any.path = ../../assets/wallpaper.webp;
  };

  # X Wayland Satellite
  systemd.user.services = {
    xwayland-satellite = {
      Unit = {
        PartOf = [ "niri.service" ];
        After = [ "niri.service" ];
      };

      Service = {
        ExecStart = lib.getExe pkgs.xwayland-satellite;
        Restart = "on-failure";
      };

      Install.WantedBy = ["niri.service"];
    };
  };
}

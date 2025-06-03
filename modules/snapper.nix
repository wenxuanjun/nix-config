{ config, lib, pkgs, ... }:

{
  services.snapper = {
    configs = {
      root = {
        SUBVOLUME = "/persist";
        ALLOW_GROUPS = [ "wheel" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = 6;
        TIMELINE_LIMIT_DAILY = 3;
        TIMELINE_LIMIT_WEEKLY = 1;
        TIMELINE_LIMIT_MONTHLY = 1;
        TIMELINE_LIMIT_YEARLY = 0;
      };

      home = {
        SUBVOLUME = "/persist/home";
        ALLOW_GROUPS = [ "wheel" ];
        TIMELINE_CREATE = true;
        TIMELINE_CLEANUP = true;
        TIMELINE_LIMIT_HOURLY = 12;
        TIMELINE_LIMIT_DAILY = 7;
        TIMELINE_LIMIT_WEEKLY = 4;
        TIMELINE_LIMIT_MONTHLY = 2;
        TIMELINE_LIMIT_YEARLY = 0;
      };
    };
  };

  # Create directories for snapshots
  # https://github.com/NixOS/nixpkgs/pull/368449
  systemd.tmpfiles.rules = [
    "Q /persist/.snapshots 0755 root root -"
    "Q /persist/home/.snapshots 0755 root root -"
  ];
}

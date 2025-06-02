{ config, lib, pkgs, ... }:

{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "thunar.desktop";
      };
    };
    configFile = {
      "xfce4/helpers.rc".text = ''
        TerminalEmulator=gnome-terminal
      '';
    };
  };
}

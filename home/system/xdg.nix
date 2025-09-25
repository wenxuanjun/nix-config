{ pkgs, ... }:

{
  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = "nemo.desktop";
      };
    };
    configFile = {
      "xfce4/helpers.rc".text = ''
        TerminalEmulator=gnome-terminal
      '';
    };
    portal = {
      enable = true;
      config.common.default = [ "gtk" ];
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
  };
}

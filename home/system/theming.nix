# Theming module for GTK and Qt applications
# This module configures the appearance of GTK and Qt applications

{ config, lib, pkgs, ... }:

{
  gtk = {
    enable = true;
    font.name = "Source Han Sans SC";
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

  qt = {
    enable = true;
    platformTheme.name = "adwaita";
    style.name = "adwaita-dark";
  };

  xdg = {
    enable = true;
    mimeApps = {
      enable = true;
      defaultApplications = {
        "inode/directory" = [ "thunar.desktop" ];
        "x-scheme-handler/terminal" = [ "org.gnome.Terminal.desktop" ];
      };
    };
  };
}

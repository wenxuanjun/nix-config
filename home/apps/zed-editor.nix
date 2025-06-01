# Zed editor configuration module
# This module configures the Zed code editor

{ config, lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "fleet-themes"
    ];
    userSettings = {
      theme = "Fleet Dark";
      buffer_line_height = { custom = 1.35; };
      terminal = { dock = "right"; };
      ui_font_size = 16;
      buffer_font_size = 14;
      ui_font_family = "SauceCodePro Nerd Font";
      buffer_font_family = "SauceCodePro Nerd Font";
    };
  };
}

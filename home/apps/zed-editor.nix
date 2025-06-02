# Zed editor configuration module
# This module configures the Zed code editor

{ config, lib, pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "fleet-themes"
      "bearded-icon-theme"
    ];
    userSettings = {
      theme = {
        mode = "system";
        light = "One Light";
        dark = "Fleet Dark";
      };
      terminal = { dock = "right"; };
      icon_theme = "Bearded Icon Theme";
      agent = {
        default_model = {
          provider = "zed.dev";
          model = "claude-sonnet-4-thinking-latest";
        };
        version = "2";
        default_profile = "write";
        always_allow_tool_actions = true;
        stream_edits = true;
      };
      buffer_line_height = { custom = 1.35; };
      ui_font_size = 15;
      buffer_font_size = 13;
      ui_font_family = "SauceCodePro Nerd Font";
      buffer_font_family = "SauceCodePro Nerd Font";
      minimap = { show = "auto"; thumb = "hover"; };
    };
  };
}

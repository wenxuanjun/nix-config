{ config, lib, pkgs, ... }:

{
  programs.niri = {
    settings = {
      binds = {
        "Mod+Return".action.spawn = "fuzzel";
        "Mod+BackSlash".action.spawn = "gnome-terminal";
        "Mod+BackSpace".action.spawn = "thunar";

        "Mod+Q".action.close-window = [];
        "Mod+Left".action.focus-column-left = [];
        "Mod+Down".action.focus-window-down = [];
        "Mod+Up".action.focus-window-up = [];
        "Mod+Right".action.focus-column-right = [];
        "Mod+Shift+Left".action.move-column-left = [];
        "Mod+Shift+Down".action.move-window-down = [];
        "Mod+Shift+Up".action.move-window-up = [];
        "Mod+Shift+Right".action.move-column-right = [];
        "Mod+WheelScrollDown".action.focus-workspace-down = [];
        "Mod+WheelScrollUp".action.focus-workspace-up = [];
        "Mod+Shift+WheelScrollDown".action.move-column-to-workspace-down = [];
        "Mod+Shift+WheelScrollUp".action.move-column-to-workspace-up = [];

        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        "Mod+F".action.maximize-column = [];
        "Mod+Shift+F".action.fullscreen-window = [];
        "Mod+C".action.center-column = [];
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
        "Mod+Shift+Minus".action.set-window-height = "-20%";
        "Mod+Shift+Equal".action.set-window-height = "+20%";

        "Mod+P".action.power-off-monitors = [];
        "Mod+V".action.toggle-window-floating = [];
        "Print".action.screenshot = [];
        "Ctrl+Print".action.screenshot-screen = [];
        "Alt+Print".action.screenshot-window = [];
      };
      outputs = {
        "STD Computer Inc iPlaoe 123456789000" = {
          mode = {
            width = 3840;
            height = 2160;
          };
          scale = 1.5;
        };
      };
      prefer-no-csd = true;
      environment.DISPLAY = ":0";
      hotkey-overlay.skip-at-startup = true;
      window-rules = [
        {
          geometry-corner-radius = {
            top-left = 8.0;
            top-right = 8.0;
            bottom-left = 8.0;
            bottom-right = 8.0;
          };
          clip-to-geometry = true;
        }
      ];
      layout = {
        gaps = 8;
        default-column-width = {
          proportion = 0.5;
        };
        focus-ring = {
          width = 1;
          active.color = "#50a8ff";
          inactive.color = "#505050";
        };
      };
      input = {
        touchpad = {
          scroll-factor = 0.25;
        };
        power-key-handling = {
          enable = false;
        };
        focus-follows-mouse = {
          enable = true;
          max-scroll-amount = "10%";
        };
        workspace-auto-back-and-forth = true;
      };
    };
  };
}

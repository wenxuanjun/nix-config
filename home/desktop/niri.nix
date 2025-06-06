{ config, lib, pkgs, ... }:

let
  workspaceBinds = builtins.listToAttrs (
    builtins.concatMap (i: [
      {
        name = "Mod+${toString i}";
        value = { action.focus-workspace = i; };
      }
      {
        name = "Mod+Shift+${toString i}";
        value = { action.move-column-to-workspace = i; };
      }
    ]) (builtins.genList (i: i + 1) 9)
  );

  appBinds = {
    "Mod+Return".action.spawn = "fuzzel";
    "Mod+BackSlash".action.spawn = "gnome-terminal";
    "Mod+BackSpace".action.spawn = "thunar";
  };

  windowBinds = {
    "Mod+Q".action.close-window = [];
    "Mod+Left".action.focus-column-left = [];
    "Mod+Down".action.focus-window-down = [];
    "Mod+Up".action.focus-window-up = [];
    "Mod+Right".action.focus-column-right = [];
    "Mod+Shift+Left".action.move-column-left = [];
    "Mod+Shift+Down".action.move-window-down = [];
    "Mod+Shift+Up".action.move-window-up = [];
    "Mod+Shift+Right".action.move-column-right = [];
  };

  workspaceNavBinds = {
    "Mod+WheelScrollDown".action.focus-workspace-down = [];
    "Mod+WheelScrollUp".action.focus-workspace-up = [];
    "Mod+Shift+WheelScrollDown".action.move-column-to-workspace-down = [];
    "Mod+Shift+WheelScrollUp".action.move-column-to-workspace-up = [];
  };

  sizeBinds = {
    "Mod+F".action.maximize-column = [];
    "Mod+Shift+F".action.fullscreen-window = [];
    "Mod+C".action.center-column = [];
    "Mod+Minus".action.set-column-width = "-10%";
    "Mod+Equal".action.set-column-width = "+10%";
    "Mod+Shift+Minus".action.set-window-height = "-20%";
    "Mod+Shift+Equal".action.set-window-height = "+20%";
  };

  miscBinds = {
    "Mod+P".action.power-off-monitors = [];
    "Mod+V".action.toggle-window-floating = [];
    "Print".action.screenshot = [];
    "Ctrl+Print".action.screenshot-screen = [];
    "Alt+Print".action.screenshot-window = [];
  };
in
{
  programs.niri = {
    settings = {
      binds = lib.foldl lib.recursiveUpdate {} [
        appBinds
        windowBinds
        workspaceNavBinds
        sizeBinds
        miscBinds
        workspaceBinds
      ];

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

      environment = {
        DISPLAY = ":0";
        LANG = "zh_CN.UTF-8";
        LANGUAGE = "zh_CN:en_US";
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

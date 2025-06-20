{ pkgs, ... }:

{
  programs.zed-editor = {
    enable = true;
    package = pkgs.zed-editor-fhs;
    extensions = [
      "nix"
      "fleet-themes"
      "bearded-icon-theme"
      "wakatime"
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
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      languages = {
        Nix = {
          format_on_save = "off";
          language_servers = [ "nixd" "!nil" ];
        };
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

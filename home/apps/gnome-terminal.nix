{ ... }:

{
  programs.gnome-terminal = {
    enable = true;
    profile = {
      "e0b782ed-6aca-44eb-8c75-62b3706b6220" = {
        colors = {
          backgroundColor = "#151515";
          foregroundColor = "#f5f5f5";
          palette = [
            "#151515"
            "#ac4142"
            "#90a959"
            "#f4bf75"
            "#6a9fb5"
            "#aa759f"
            "#75b5aa"
            "#d0d0d0"
            "#505050"
            "#ac4142"
            "#90a959"
            "#f4bf75"
            "#6a9fb5"
            "#aa759f"
            "#75b5aa"
            "#f5f5f5"
          ];
        };
        default = true;
        font = "SauceCodePro Nerd Font 10";
        scrollbackLines = 1000000;
        visibleName = "Default";
      };
    };
  };
}

{ pkgs, ... }:

{
  # Wallpaper
  services.wpaperd = {
    enable = true;
    settings.any.path = ../../assets/wallpaper.webp;
  };

  # Polkit Agent
  systemd.user.services = {
    polkit-gnome-agent = {
      Unit = {
        description = "PolicyKit Authentication Agent";
        Wants = [ "graphical-session.target" ];
        After = [ "graphical-session.target" ];
      };
      Install = {
        WantedBy = [ "graphical-session.target" ];
      };
      Service = {
        Type = "simple";
        ExecStart = "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1";
        Restart = "on-failure";
        RestartSec = 1;
        TimeoutStopSec = 10;
      };
    };
  };
}

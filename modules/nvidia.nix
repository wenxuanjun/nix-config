{ pkgs, ... }:

{
  hardware.nvidia = {
    open = true;
    modesetting.enable = true;
  };

  services.xserver.videoDrivers = ["nvidia"];

  hardware.graphics.extraPackages = with pkgs; [
    nvidia-vaapi-driver
  ];
}

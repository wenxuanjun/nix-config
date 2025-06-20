{ pkgs, ... }:

{
  # Core system packages available to all users
  environment.systemPackages = with pkgs; [
    git
    micro
    fd
    ripgrep
  ];

  # Internationalization properties
  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocales = [ "zh_CN.UTF-8/UTF-8" ];
  };

  # Allow installation of unfree packages
  nixpkgs.config.allowUnfree = true;

  # Enable services for better file manager functionality
  services.gvfs.enable = true;
  services.tumbler.enable = true;

  # Enable experimental features for flakes
  nix.settings = {
    substituters = [
      "https://mirrors.ustc.edu.cn/nix-channels/store"
      "https://cache.nixos.org"
    ];

    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
  };

  # Enable automatic garbage collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };
}

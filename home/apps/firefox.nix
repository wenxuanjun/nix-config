# Firefox browser configuration module
# This module configures Firefox and its extensions

{ config, lib, pkgs, ... }:

{
  programs.firefox = {
    enable = true;
    languagePacks = ["zh-CN"];
    profiles.wendster = {
      isDefault = true;
      extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
        bitwarden
        immersive-translate
        tampermonkey
      ];
    };
  };
}
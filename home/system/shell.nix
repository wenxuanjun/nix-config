{ config, lib, pkgs, ... }:

{
  programs = {
    fzf.enable = true;
    lsd.enable = true;
    bat.enable = true;
    htop.enable = true;
    fastfetch.enable = true;
  };

  programs.bash = {
    enable = true;
    shellAliases = {
      cat = "bat -pp";
    };
  };

  programs.mcfly = {
    enable = true;
    fzf.enable = true;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    disableConfirmationPrompt = true;
  };
}

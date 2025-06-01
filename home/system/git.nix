# Git configuration module
# This module configures Git with user information, aliases, and sensible defaults

{ config, lib, pkgs, ... }:

{
  programs.git = {
    enable = true;

    userName = "wenxuanjun";
    userEmail = "wenxuanjun@yahoo.com";

    extraConfig = {
      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
      push.autoSetupRemote = true;
    };
  };
}

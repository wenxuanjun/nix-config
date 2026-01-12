{ ... }:

{
  programs = {
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
    fuzzySearchFactor = 2;
  };

  programs.tmux = {
    enable = true;
    mouse = true;
    disableConfirmationPrompt = true;
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
      package.disabled = true;
      directory.truncate_to_repo = false;
    };
  };
}

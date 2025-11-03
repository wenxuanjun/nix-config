{ ... }:

{
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "wenxuanjun";
        email = "wenxuanjun@yahoo.com";
      };
      init.defaultBranch = "main";
      pull.rebase = true;
      fetch.prune = true;
      push.autoSetupRemote = true;
    };
  };
}

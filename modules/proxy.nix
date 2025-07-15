{ pkgs, ... }:

{
  programs.nekoray = {
    enable = true;
    tunMode.enable = true;
  };

  programs.proxychains = {
    enable = true;
    package = pkgs.proxychains-ng;
    quietMode = true;
    proxies.default = {
      enable = true;
      type = "http";
      host = "127.0.0.1";
      port = 2080;
    };
  };
}

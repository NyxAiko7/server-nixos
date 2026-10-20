{ config, pkgs, ... }:

{
  services.qbittorrent = {
    enable = true;
    openFirewall = true; 
    user = "aiko";
    group = "users";
    
    serverConfig = {
      LegalNotice.Accepted = true;
      Preferences = {
        Downloads = {
          SavePath = "/mnt/anime";
          TempPath = "/mnt/anime/downloads";
        };
        WebUI = {
          LocalHostAuth = false;
        };
      };
    };
  };
}

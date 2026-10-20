{ config, pkgs, ... }:

{
  services.samba = {
    enable = true;
    openFirewall = true;
    settings = {
      global = {
        "workgroup" = "WORKGROUP";
        "server string" = "NixOS Anime Server";
        "security" = "user";
      };
      "anime" = {
        path = "/mnt/anime";
        "browseable" = "yes";
        "read only" = "no";
        "guest ok" = "no";
        "create mask" = "0644";
        "directory mask" = "0755";
        "valid users" = "aiko";
	"force user" = "aiko";
	"force group" = "users";
      };
    };
  };

  services.jellyfin = {
    enable = true;
    openFirewall = true;
    group = "users"; 
  };
}

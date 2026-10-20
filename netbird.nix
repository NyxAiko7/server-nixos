{ config, pkgs, ... }:

{
  services.netbird.enable = true;
  services.netbird.clients.wt0 = {
    port = 51820;
    login = {
      enable = true;
      setupKeyFile = "/etc/netbird-setup-key";
    };
    openFirewall = true;
    openInternalFirewall = true;
  };
  services.resolved.enable = true;
}

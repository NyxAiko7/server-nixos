{ config, pkgs, ... }:

{
 
  services.prometheus.exporters.node = {
    enable = true;
    port = 9100;
    enabledCollectors = [ "systemd" "logind" "processes" ];
  };

  
  services.prometheus = {
    enable = true;
    port = 9090;
    globalConfig.scrape_interval = "10s"; 
    
    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [{
          targets = [ "localhost:9100" ];
        }];
      }
    ];
  };

  
  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "0.0.0.0"; 
        http_port = 3000;
	domain = "192.168.1.105";
	root_url = "http://192.168.1.105:3000/";
      };
      security = {
       
        secret_key = " ";
      };
      
      "auth.anonymous" = { enabled = false; };
    };

    
    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://localhost:9090";
          isDefault = true;
        }
      ];
    };
  };

  
  networking.firewall.allowedTCPPorts = [ 3000 9090 9100 ];
}

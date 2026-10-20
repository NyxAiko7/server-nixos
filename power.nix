{ config, pkgs, lib, ... }:

{
  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "powersave"; 
      CPU_ENERGY_PERF_POLICY_ON_AC = "balance_power";
    };
  };
  powerManagement.powertop.enable = true;

  hardware.bluetooth.enable = false;
  services.printing.enable = false;
  services.avahi.enable = false;
}

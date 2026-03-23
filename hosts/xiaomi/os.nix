{ host, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "26.05";
  networking.hostName = host;
}

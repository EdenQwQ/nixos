{ host, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "26.05";
  networking.hostName = host;
  boot.kernelParams = [
    "i8042.dumbkbd"
    "xe.enable_psr=0"
  ];
}

{ host, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "26.05";
  networking.hostName = host;
  boot.kernelParams = [
    "i8042.reset"
    "i8042.nomux"
    "i8042.nopnp"
    "i8042.dumbkbd"
    "xe.force_probe=*"
    "xe.enable_psr=0"
  ];
}

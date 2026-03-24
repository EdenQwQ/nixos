{ host, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];
  system.stateVersion = "26.05";
  networking.hostName = host;
  boot.kernelParams = [
    "i8042.dumbkbd"
    "xe.enable_psr=0"
  ];
  # services.udev.extraHwdb = ''
  #   evdev:name:BLTP7853:00 347D:7853 Touchpad:*
  #    ID_INPUT_TOUCHPAD=1
  #    ID_BUS=i2c
  #    ID_INTEGRATION=internal
  #    ID_INPUT_TOUCHPAD_INTEGRATION=internal
  # '';
}

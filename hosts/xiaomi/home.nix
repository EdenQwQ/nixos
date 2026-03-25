{ config, pkgs, ... }:
{
  monitors = {
    "eDP-1" = {
      isMain = true;
      scale = 2.2;
      mode = {
        width = 3120;
        height = 2080;
        refresh = 120.0;
      };
      position = {
        x = 1000;
        y = 0;
      };
      rotation = 0;
      focus-at-startup = true;
    };
    "HDMI-A-1" = {
      scale = 1.6;
      mode = {
        width = 2560;
        height = 1600;
        refresh = 60.0;
      };
      position = {
        x = 0;
        y = 60;
      };
      rotation = 90;
    };
  };
  programs.niri.settings = {
    input.touch.enable = true;
    input.touch.map-to-output = config.lib.monitors.mainMonitorName;
  };
  stylix.cursor = {
    package = pkgs.hachiyo-cursors;
    name = "hachiyo";
    size = 32;
  };
  home.stateVersion = "26.05";
}

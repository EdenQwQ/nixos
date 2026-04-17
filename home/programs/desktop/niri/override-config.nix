{ pkgs, config, ... }:
with config.lib.stylix.colors.withHashtag;
let
  extraConfig =
    # kdl
    ''
      blur {
          passes 3
          offset 3
          noise 0.02
          saturation 1.5
      }
      window-rule {
          background-effect {
              xray true
              blur true
          }
      }
      window-rule {
          match is-floating=true
          background-effect {
              xray false
              blur true
          }
      }
      window-rule {
          match app-id="ai.moeru.airi"
          open-floating true
          background-effect {
              blur false
          }
          border {
              off
          }
          shadow {
              off
          }
      }
      layer-rule {
          match namespace="launcher"
          background-effect {
              xray false
              blur true
          }
      }
      layer-rule {
          match namespace="^noctalia-(background|launcher-overlay|dock)-.*$"
          background-effect {
              xray false
              blur true
          }
      }

      recent-windows {
          open-delay-ms 150

          highlight {
              active-color "${base0E}aa"
              urgent-color "${base08}aa"
              padding 30
              corner-radius 20
          }

          previews {
              max-height 480
              max-scale 0.5
          }

          binds {
              Alt+Tab         { next-window; }
              Alt+Shift+Tab   { previous-window; }
              Alt+grave       { next-window     filter="app-id"; }
              Alt+Shift+grave { previous-window filter="app-id"; }

              Mod+Tab         { next-window; }
              Mod+Shift+Tab   { previous-window; }
              Mod+grave       { next-window     filter="app-id"; }
              Mod+Shift+grave { previous-window filter="app-id"; }
          }
      }
    '';
  finalNiriConfig =
    builtins.replaceStrings
      [
        "output \"${config.lib.monitors.mainMonitorName}\" {"
        "binds {"
      ]
      [
        ''
          output "${config.lib.monitors.mainMonitorName}" {
              hot-corners {
                  top-right
              }
        ''
        ''
          binds {
              Shift_R { release { toggle-overview; }; }
        ''
      ]
      config.programs.niri.finalConfig
    + "\n"
    + extraConfig;
in
{
  home.file.".config/niri/config-override.kdl".text = finalNiriConfig;
}

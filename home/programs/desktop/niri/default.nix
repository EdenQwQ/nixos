{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./animations.nix
    ./waybar.nix
    ./autostart.nix
    ./override-config.nix
    ./swhkd.nix
  ];

  programs.niri = {
    # home.file.".config/niri/config.kdl".source = ./config.kdl;
    enable = true;
    package = pkgs.niri-unstable;
    settings =
      with config.lib.stylix.colors.withHashtag;
      let
        shadowConfig = {
          enable = true;
          spread = 0;
          softness = 10;
          color = "#000000dd";
        };
      in
      {
        hotkey-overlay.skip-at-startup = true;
        prefer-no-csd = true;
        input = {
          focus-follows-mouse.enable = true;
          touchpad.natural-scroll = false;
          keyboard.xkb.options = "caps:escape";
        };
        outputs = builtins.mapAttrs (name: value: {
          inherit (value) scale mode position;
          transform.rotation = value.rotation;
          background-color = base01;
        }) config.monitors;
        binds = with config.lib.niri.actions; {
          "Mod+Return".action = spawn "kitty";
        };
        window-rules = [
          {
            geometry-corner-radius = {
              bottom-left = 10.0;
              bottom-right = 10.0;
              top-left = 10.0;
              top-right = 10.0;
            };
            clip-to-geometry = true;
            draw-border-with-background = false;
          }
          {
            matches = [
              { app-id = "yad"; }
            ];
            open-floating = true;
          }
          {
            matches = [
              { app-id = "firefox"; }
              { app-id = "org.qutebrowser.qutebrowser"; }
              { app-id = "kitty"; }
              { app-id = "evince"; }
              { app-id = "zathura"; }
            ];
            default-column-width = {
              proportion = 1.0;
            };
          }
          {
            matches = [
              { is-focused = true; }
            ];
            opacity = 0.95;
          }
          {
            matches = [
              { is-focused = false; }
            ];
            opacity = 0.85;
          }
        ];
        layer-rules = [
          {
            matches = [ { namespace = "launcher"; } ];
            geometry-corner-radius = {
              bottom-left = 15.0;
              bottom-right = 15.0;
              top-left = 15.0;
              top-right = 15.0;
            };
            shadow = shadowConfig;
          }
        ];
        gestures = {
          dnd-edge-view-scroll = {
            trigger-width = 60;
            delay-ms = 100;
            max-speed = 1500;
          };
        };
        workspaces = {
          "1" = {
            open-on-output = config.lib.monitors.mainMonitorName;
            name = "coding";
          };
          "2" = {
            open-on-output = config.lib.monitors.mainMonitorName;
            name = "browsing";
          };
          "3" = {
            open-on-output = builtins.head config.lib.monitors.otherMonitorsNames;
            name = "reading";
          };
          "4" = {
            open-on-output = config.lib.monitors.mainMonitorName;
            name = "music";
          };
        };
        layout = {
          gaps = 12;
          border = {
            enable = true;
            width = 4;
            active = {
              gradient = {
                from = base07;
                to = base0E;
                angle = 45;
                in' = "oklab";
                # relative-to = "workspace-view";
              };
            };
            # inactive.color = "#585b70";
            inactive.color = base02;
          };
          focus-ring.enable = false;
          struts = {
            left = 2;
            right = 2;
            top = 0;
            bottom = 2;
          };
          insert-hint = {
            enable = true;
            display = {
              gradient = {
                # from = "#f9e2af";
                from = base0A;
                # to = "#eba0ac";
                to = base09;
                angle = 45;
              };
            };
          };
          shadow = shadowConfig;
          tab-indicator = {
            hide-when-single-tab = true;
            gap = 5;
            width = 6;
            length.total-proportion = 0.5;
            position = "right";
            gaps-between-tabs = 2;
          };
        };
      };
  };
}

{
  pkgs,
  lib,
  user,
  ...
}:
let
  niri-autostart = pkgs.writeShellApplication {
    name = "niri-autostart";
    runtimeInputs = with pkgs; [
      niri-blur-wallpaper
      swww
      clash-meta
      wlsunset
      killall
    ];
    extraShellCheckFlags = [ ];
    bashOptions = [ ];
    text =
      # bash
      ''
        killall swhkd
        killall swhks
        swhks &
        doas pkexec swhkd -c ~/.config/niri/swhkd/niri.swhkdrc &
        swww kill
        swww-daemon &
        clash-meta -d ~/.config/clash &
        wlsunset -s 00:00 -S 00:00 -t 5000 -T 5001 &
        niri-blur-wallpaper &
      '';
  };
  niri-blur-wallpaper = pkgs.writers.writePython3Bin "niri-blur-wallpaper" { doCheck = false; } ''
    import os
    import subprocess
    import json

    wallpapers_path = "/home/${user}/Pictures/Wallpapers/generated/"
    wallpapers_cache_path = "/home/${user}/.cache/swww/"
    events_of_interest = [
        "Workspace changed",
        "Workspace focused",
        "Window opened",
        "Window closed",
    ]


    def get_niri_msg_output(msg):
        output = subprocess.check_output(["niri", "msg", "-j", msg])
        output = json.loads(output)
        return output


    def get_current_wallpaper(monitor):
        with open(os.path.join(wallpapers_cache_path, monitor)) as f:
            wallpaper = str(f.read())
            return wallpaper


    def set_wallpaper(monitor, wallpaper):
        subprocess.run(
            [
                "swww",
                "img",
                "--transition-type",
                "fade",
                "--transition-duration",
                "0.5",
                "-o",
                monitor,
                wallpaper,
            ]
        )


    def get_wallpaper_name(wallpaper_path):
        current_wallpaper_is_blurred = "blurred" in wallpaper_path
        if current_wallpaper_is_blurred:
            wallpaper_name = "-".join(wallpaper_path.split("-")[1:-1])
        else:
            wallpaper_name = "-".join(wallpaper_path.split("-")[1:])
            wallpaper_name = ".".join(wallpaper_name.split(".")[:-1])
        return wallpaper_name


    def set_wallpaper_if_needed(active_workspace, init):
        active_workspace_monitor = active_workspace["output"]
        current_wallpaper = get_current_wallpaper(active_workspace_monitor)
        current_wallpaper_is_live = current_wallpaper.endswith(".gif")
        if current_wallpaper_is_live:
            return
        wallpaper_name = get_wallpaper_name(current_wallpaper)
        active_workspace_is_empty = active_workspace["active_window_id"] is None
        if active_workspace_is_empty:
            wallpaper = os.path.join(wallpapers_path, f"{wallpaper_name}.jpg")
        else:
            wallpaper = os.path.join(wallpapers_path, f"{wallpaper_name}-blurred.jpg")
        real_wallpaper = os.path.realpath(wallpaper)
        if current_wallpaper == real_wallpaper and not init:
            return
        set_wallpaper(active_workspace_monitor, wallpaper)


    def change_wallpaper(init=False):
        workspaces = get_niri_msg_output("workspaces")
        active_workspaces = [
            workspace for workspace in workspaces if workspace["is_active"]
        ]
        for active_workspace in active_workspaces:
            set_wallpaper_if_needed(active_workspace, init)


    def main():
        change_wallpaper(init=True)
        event_stream = subprocess.Popen(
            ["niri", "msg", "event-stream"], stdout=subprocess.PIPE
        )
        if not event_stream.stdout:
            return
        for line in iter(event_stream.stdout.readline, ""):
            if any(event in line.decode() for event in events_of_interest):
                change_wallpaper()


    if __name__ == "__main__":
        main()
  '';
in
{
  systemd.user.services.niri-blur-wallpaper = {
    Unit = {
      Description = "Niri Blur Wallpaper";
      BindsTo = [ "graphical-session.target" ];
      Before = [ "graphical-session.target" ];
      Wants = [ "graphical-session-pre.target" ];
      After = [ "graphical-session-pre.target" ];
    };
    Install = {
      WantedBy = [ "graphical-session.target" ];
      Wants = [ "xdg-desktop-autostart.target" ];
      After = [ "xdg-desktop-autostart.target" ];
    };
    Service = {
      Type = "simple";
      ExecStart = "${niri-blur-wallpaper}/bin/niri-blur-wallpaper";
      Restart = "on-failure";
      RestartSec = "5s";
    };
  };
  home.activation.restart-niri-blur-wallpaper =
    lib.hm.dag.entryAfter [ "reload-waybar" ]
      # bash
      ''run --quiet ${pkgs.systemd}/bin/systemctl --user restart niri-blur-wallpaper'';
  programs.niri.settings.spawn-at-startup = [
    { command = [ "${niri-autostart}/bin/niri-autostart" ]; }
    {
      command = [
        "fcitx5"
        "-d"
      ];
    }
  ];
}

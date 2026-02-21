{
  inputs,
  pkgs,
  config,
  lib,
  ...
}:
{
  options.desktopShell =
    with lib;
    mkOption {
      type = types.str;
      description = "The desktop shell to use.";
    };

  config = {
    programs.waybar = {
      enable = config.desktopShell == "waybar";
      systemd.enable = config.desktopShell == "waybar";
    };
    programs.dank-material-shell = {
      enable = config.desktopShell == "dms";
      systemd.enable = config.desktopShell == "dms";
    };
    programs.caelestia = {
      enable = config.desktopShell == "caelestia";
      systemd.enable = config.desktopShell == "caelestia";
    };
    programs.noctalia-shell.enable = config.desktopShell == "noctalia-shell";
    home.packages = lib.mkIf (config.desktopShell == "noctalia-shell") [
      inputs.noctalia-shell.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
}

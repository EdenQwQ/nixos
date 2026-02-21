{ inputs, pkgs, ... }:
{
  imports = [
    ./tofi.nix
    ./fonts.nix
    ./mako.nix
    ./niri
    ./swhkd.nix
    ./dms.nix
    ./caelestia.nix
    ./noctalia.nix
    # ./scroll
    # ./mango
  ];
  home.packages = with pkgs; [
    awww
    swaybg
    kanshi
    wlsunset
    xwayland-satellite
    wmname
    inputs.hexecute.packages.${pkgs.stdenv.hostPlatform.system}.default
  ];
  home.file."scripts" = {
    source = ./scripts;
    recursive = true;
  };
  home.sessionVariables.QT_QPA_PLATFORMTHEME = "gtk3";
  services.wl-clip-persist.enable = true;
}

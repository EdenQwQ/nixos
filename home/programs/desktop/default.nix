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
  home.packages =
    with pkgs;
    let
      system = pkgs.stdenv.hostPlatform.system;
      newLibinput = inputs.nixpkgs-new-libinput.legacyPackages.${system}.libinput;
      driftwm-fixed = inputs.driftwm.packages.${system}.default.overrideAttrs (oldAttrs: {
        buildInputs = (builtins.filter (p: (p.pname or "") != "libinput") oldAttrs.buildInputs) ++ [
          newLibinput
        ];
        postFixup = ''
          patchelf --add-rpath "${
            pkgs.lib.makeLibraryPath (
              (builtins.filter (p: (p.pname or "") != "libinput") oldAttrs.buildInputs) ++ [ newLibinput ]
            )
          }" $out/bin/driftwm
        '';
        cargoDeps = pkgs.rustPlatform.importCargoLock {
          lockFile = "${inputs.driftwm}/Cargo.lock";
          outputHashes = {
            "smithay-drm-extras-0.1.0" = "sha256-6iTLezGeSnefQbCoZHsXayinjFvrsC7ezW88tlZx9Y0=";
          };
        };
      });
    in
    [
      awww
      swaybg
      kanshi
      wlsunset
      xwayland-satellite
      wmname
      inputs.hexecute.packages.${system}.default
      driftwm-fixed
      halley
    ];
  home.file."scripts" = {
    source = ./scripts;
    recursive = true;
  };
  home.sessionVariables.QT_QPA_PLATFORMTHEME = "gtk3";
  services.wl-clip-persist.enable = true;
  services.waydeeper.enable = true;
}

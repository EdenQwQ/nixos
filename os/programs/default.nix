{ inputs, pkgs, ... }:
{
  imports = [
    ./basic.nix
    ./doas.nix
    ./niri.nix
    ./swhkd.nix
    ./matlab.nix
    ./tuigreet.nix
    # ./cosmic.nix
  ];

  services.displayManager.sessionPackages = [
    pkgs.halley
    (inputs.driftwm.packages.${pkgs.system}.default.overrideAttrs (oldAttrs: {
      cargoDeps = pkgs.rustPlatform.importCargoLock {
        lockFile = "${inputs.driftwm}/Cargo.lock";
        outputHashes = {
          "smithay-drm-extras-0.1.0" = "sha256-6iTLezGeSnefQbCoZHsXayinjFvrsC7ezW88tlZx9Y0=";
        };
      };
    }))
  ];
}

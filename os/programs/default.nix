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
  ];
}

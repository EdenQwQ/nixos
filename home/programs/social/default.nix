{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    wemeet
  ];
}

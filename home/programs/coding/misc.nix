{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alejandra
    nixfmt
    texlab
    nodePackages.prettier
    julia-bin
  ];
}

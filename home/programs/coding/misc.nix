{ pkgs, ... }:
{
  home.packages = with pkgs; [
    alejandra
    nixfmt
    texlab
    nodePackages.prettier
    antigravity
    julia-bin
  ];
}

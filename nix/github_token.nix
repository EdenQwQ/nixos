{ config, pkgs, ... }:
{
  nix = {
    package = pkgs.nix;
    extraOptions = ''
      !include ${config.age.secrets.nix_github_token.path}
    '';
  };
}

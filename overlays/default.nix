{ inputs, ... }:
{
  additions =
    final: prev:
    import ../pkgs {
      pkgs = final;
    };

  modifications = final: prev: {
    qutebrowser = prev.qutebrowser.override { enableWideVine = true; };
    base16-schemes = prev.base16-schemes.overrideAttrs (oldAttrs: {
      installPhase = ''
        runHook preInstall

        mkdir -p $out/share/themes/
        install base16/*.yaml $out/share/themes/
        install ${final.custom-colorschemes}/share/themes/*.yaml $out/share/themes/

        runHook postInstall
      '';
    });
    sway-unwrapped =
      (prev.sway-unwrapped.overrideAttrs (oldAttrs: {
        src = inputs.scroll;
        patches = [ ];
      })).override
        { inherit (inputs.nixpkgs-wayland.packages.${final.stdenv.hostPlatform.system}) wlroots; };
    sway = prev.sway.overrideAttrs (oldAttrs: {
      passthru.providedSessions = [ "scroll" ];
    });
    inherit (inputs.awww.packages.${final.stdenv.hostPlatform.system}) awww;
    libfprint = prev.libfprint.overrideAttrs (oldAttrs: {
      src = final.fetchFromGitLab {
        domain = "gitlab.freedesktop.org";
        owner = "libfprint";
        repo = "libfprint";
        rev = "d79f157282085738ea8ffbe8c2ae96fb8b3ad831";
        hash = "sha256-Ek5MxO+XgTeJ1wty0+WiMf1PUKJTyo/TjIgjWQV8wt8=";
      };
    });
  };

  inherit (inputs.niri.overlays) niri;
  nur = inputs.nur.overlays.default;
  nix-matlab = inputs.nix-matlab.overlay;
  inherit (inputs.nixpkgs-mozilla.overlays) firefox;
}

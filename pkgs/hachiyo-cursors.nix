# Converted from https://www.bilibili.com/video/BV1XqZjB5E9u
{
  lib,
  stdenv,
  fetchFromGitHub,
}:
stdenv.mkDerivation {
  pname = "hachiyo-cursors";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "EdenQwQ";
    repo = "hachiyo-cursors";
    rev = "8f80a599a6302ea04f91a6073b5cf091ca615852";
    sha256 = "sha256-3daEcx/DAimF1C6c02E/4WqEiPq6OwBvntAp9Jc0lbY=";
  };

  installPhase = "
    mkdir -p $out/share/icons/hachiyo
    cp -r * $out/share/icons/hachiyo
    ";

  meta = {
    description = "Hachiyo cursor theme";
    homepage = "https://github.com/EdenQwQ/hachiyo-cursors";
  };
}

# copied from https://github.com/nix-community/nur-combined/blob/main/repos/hhr2020/pkgs/fiz/default.nix
{
  lib,
  stdenv,
  rustPlatform,
  fetchNpmDeps,
  cargo-tauri,
  copyDesktopItems,
  glib-networking,
  nodejs,
  npmHooks,
  openssl,
  pkg-config,
  webkitgtk_4_1,
  wrapGAppsHook4,
  fetchFromGitHub,
  jq,
  moreutils,
}:

rustPlatform.buildRustPackage rec {
  pname = "fiz";
  version = "0.3.5";

  src = fetchFromGitHub {
    owner = "CrazySpottedDove";
    repo = "fiz";
    rev = "cae430f74ebaafe9167e7a8698540179162e5d87";
    hash = "sha256-8Fyvy52KQyG8+kf9BGUQ2zyM6+iUFKaOfL9h15QBKOk=";
  };

  useFetchCargoVendor = true;
  cargoHash = "sha256-1ERKMENPMTn5CPK4d5uTZ18ONMrCEY2PIK1GqSGHnSg=";

  npmDeps = fetchNpmDeps {
    name = "${pname}-npm-deps-${version}";
    inherit src;
    hash = "sha256-jSgBrMPDmC98bcG44s0npA0Gu0mG8/qbJ3X3wNIHSY8=";
  };

  nativeBuildInputs = [
    cargo-tauri.hook
    nodejs
    npmHooks.npmConfigHook

    pkg-config
    wrapGAppsHook4
    copyDesktopItems

    jq
    moreutils
  ];

  buildInputs =
    [ openssl ]
    ++ lib.optionals stdenv.hostPlatform.isLinux [
      glib-networking
      webkitgtk_4_1
    ];

  cargoRoot = "src-tauri";
  buildAndTestSubdir = cargoRoot;

  postPatch = ''
    jq \
    '.bundle.createUpdaterArtifacts = false' \
    src-tauri/tauri.conf.json \
    | sponge src-tauri/tauri.conf.json
  '';

  meta = {
    homepage = "https://github.com/CrazySpottedDove/fiz";
    changelog = "https://github.com/CrazySpottedDove/fiz/releases/tag/app-v${version}";
    description = "Third-party app for Learning in ZJU";
    mainProgram = "fiz";
    license = lib.licenses.mit;
  };
}

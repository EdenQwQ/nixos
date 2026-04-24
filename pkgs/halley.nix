{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  wayland,
  libxkbcommon,
  libinput,
  seatd,
  libGL,
  libgbm,
  libdisplay-info,
  libdrm,
  systemd,
  vulkan-loader,
}:
rustPlatform.buildRustPackage {
  pname = "halley";
  version = "0.1.0";

  src = fetchFromGitHub {
    owner = "saltnpepper97";
    repo = "halley";
    rev = "v0.1.0";
    hash = "sha256-c7cf1305a3f45338d4e55f27979df2a179a2c503c4218124513c5bf2ec877124";
  };

  cargoHash = lib.fakeSha256;

  nativeBuildInputs = [
    pkg-config
    rustPlatform.bindgenHook
  ];

  buildInputs = [
    wayland
    libxkbcommon
    libinput
    seatd
    libGL
    libgbm
    libdisplay-info
    libdrm
    systemd
    vulkan-loader
  ];

  doCheck = false;

  env = {
    RUSTFLAGS = toString (
      map (arg: "-C link-arg=" + arg) [
        "-Wl,--push-state,--no-as-needed"
        "-lEGL"
        "-lwayland-client"
        "-Wl,--pop-state"
      ]
    );
  };

  meta = with lib; {
    description = "Spatial Wayland compositor built around infinite workspace navigation";
    homepage = "https://github.com/saltnpepper97/halley";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
}

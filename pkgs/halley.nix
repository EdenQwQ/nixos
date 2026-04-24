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
    rev = "92ab43f71abf359456ca4f9da96c5b146e98b165";
    hash = "sha256-3OEY0OdQvMfSNhzvw+lXkTBmyzT+ZiPZhWBXS87wTuo=";
  };

  cargoHash = "sha256-Ze03sLTAWuxd6sghvsyghgwF9PjHcH5lIc99fwMdwp0=";

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

  postInstall = ''
        install -Dm644 packaging/xdg-desktop-portal/halley-portals.conf $out/share/xdg-desktop-portal/halley-portals.conf
        cat > $out/bin/halley-session <<'EOF'
    #!/bin/sh
    systemctl --user import-environment
    if hash dbus-update-activation-environment 2>/dev/null; then
        dbus-update-activation-environment --all
    fi
    systemctl --user start graphical-session-pre.target
    systemctl --user start graphical-session.target
    halley
    systemctl --user stop graphical-session.target
    systemctl --user stop graphical-session-pre.target
    systemctl --user unset-environment WAYLAND_DISPLAY DISPLAY
    EOF
        chmod +x $out/bin/halley-session
        mkdir -p $out/share/wayland-sessions
        cat > $out/share/wayland-sessions/halley.desktop <<EOF
    [Desktop Entry]
    Name=Halley
    Comment=Spatial Wayland compositor built around infinite workspace navigation
    Exec=halley-session
    Type=Application
    EOF
  '';

  passthru.providedSessions = [ "halley" ];

  meta = with lib; {
    description = "Spatial Wayland compositor built around infinite workspace navigation";
    homepage = "https://github.com/saltnpepper97/halley";
    license = licenses.gpl3Only;
    platforms = platforms.linux;
  };
}

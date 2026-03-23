{
  pkgs,
  config,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    zoxide
    gnome-tweaks
    networkmanagerapplet
    wayland-logout
    wl-clipboard
    sd
    socat
    pandoc
    # typst
    dust
    killall
    htop
    gparted
    gimp3
    inputs.nixpkgs-stable.legacyPackages.${pkgs.stdenv.hostPlatform.system}.kdePackages.kdenlive
    # tesseract # ocr
    # marp-cli
    appimage-run
    # audiowaveform
    # papers
    # nom
    yad
    # pcmanfm
    # yazi
    # ydotool
    jq
    # scrcpy
    direnv
    entr
    lutgen
    matugen
    hellwal
    imagemagick
    ffmpeg
    nurl
    nix-init
    wl-color-picker
    loupe
    showtime
    nautilus
    gnome-disk-utility
    upower
    android-tools
    tree-sitter
  ];
  imports = [
    ./eye-candy.nix
    ./obs.nix
    ./music.nix
    ./ai.nix
  ];
  programs.pay-respects.enable = true;
}

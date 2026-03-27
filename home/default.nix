{
  pkgs,
  lib,
  user,
  config,
  ...
}:
{
  imports = [
    ./lib
    ./programs
    ./tweaks
  ];

  home = {
    username = user;
    homeDirectory = "/home/${user}";

    packages = with pkgs; [
      # files
      zip
      xz
      unzip

      # utils
      ripgrep
      zoxide
      fzf
      eza
      fd
    ];

    sessionVariables = {
      all_proxy = "http://127.0.0.1:7890";
      ALL_PROXY = "http://127.0.0.1:7890";
      HTTP_PROXY = "http://127.0.0.1:7890";
      HTTPS_PROXY = "http://127.0.0.1:7890";
      http_PROXY = "http://127.0.0.1:7890";
      https_PROXY = "http://127.0.0.1:7890";
      NIXPKGS_ALLOW_UNFREE = "1";
      NIXPKGS_ALLOW_INSECURE = "1";
    };

    activation = {
      reload-shell =
        lib.hm.dag.entryAfter [ "writeBoundary" ]
          # bash
          ''
            # only run stop if the service is active
            if ${pkgs.systemd}/bin/systemctl --user is-active waybar.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop waybar.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active dms.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop dms.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active caelestia.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop caelestia.service
            fi
            if ${pkgs.systemd}/bin/systemctl --user is-active noctalia-shell.service; then
              run --silence ${pkgs.systemd}/bin/systemctl --user stop noctalia-shell.service
            fi
            run --silence ${pkgs.systemd}/bin/systemctl --user start ${config.desktopShell}.service
          '';
    };
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk
        libsForQt5.fcitx5-qt
        qt6Packages.fcitx5-chinese-addons
        fcitx5-rime
        fcitx5-pinyin-moegirl
        fcitx5-pinyin-zhwiki
      ];
      waylandFrontend = true;
    };
  };

  programs = {
    git = {
      enable = true;
      settings = {
        user = {
          name = "EdenQwQ";
          email = "lsahlm1eden@gmail.com";
        };
        safe = {
          directory = "*";
        };
        http.proxy = "http://127.0.0.1:7890";
      };
    };

    nix-index = {
      enable = true;
      enableFishIntegration = true;
      enableBashIntegration = false;
      enableZshIntegration = false;
    };

    home-manager.enable = true;
  };
}

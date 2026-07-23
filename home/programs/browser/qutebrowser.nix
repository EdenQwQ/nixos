{
  nixosVersion,
  homeManagerVersion,
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
{
  programs.qutebrowser = {
    enable = true;
    keyBindings = {
      normal = {
        ";i" = "hint images download";
      };
    };
    searchEngines =
      let
        nixvimVersion = if nixosVersion == "unstable" then "" else nixosVersion;
        hmOptionsVersion =
          if homeManagerVersion == "master" then "master" else "release-${homeManagerVersion}";
      in
      {
        nixp = "https://search.nixos.org/packages?channel=${nixosVersion}&from=0&size=50&sort=relevance&type=packages&query={}";
        nixo = "https://search.nixos.org/options?channel=${nixosVersion}&size=50&sort=relevance&type=packages&query={}";
        hm = "https://home-manager-options.extranix.com/?query={}&release=${hmOptionsVersion}";
        nv = "https://nix-community.github.io/nixvim/${nixvimVersion}/?search={}";
        gh = "https://github.com/search?q={}&type=repositories";
        toki = "https://glosbe.com/en/mis_tok/{}";
        deepl = "https://www.deepl.com/translator#en/zh/{}";
        deeplzh = "https://www.deepl.com/translator#zh/en/{}";
      };
    quickmarks = {
      github = "https://github.com";
      "nix packages" = "https://search.nixos.org/packages?";
      "nix options" = "https://search.nixos.org/options?";
      "home manager options" = "https://mipmip.github.io/home-manager-option-search";
      bilibili = "https://bilibili.com";
      "google scholar" = "https://scholar.google.com";
    };

    settings.colors =
      let
        selection-background = config.lib.stylix.colors.withHashtag.base02;
      in
      {
        completion.item.selected = {
          bg = lib.mkForce selection-background;
          border = {
            bottom = lib.mkForce selection-background;
            top = lib.mkForce selection-background;
          };
          match.fg = lib.mkForce config.lib.stylix.colors.withHashtag.base0B;
        };
        contextmenu.selected.bg = lib.mkForce selection-background;
        statusbar.caret = {
          bg = lib.mkForce selection-background;
          selection.bg = lib.mkForce selection-background;
        };
        tabs = {
          pinned.selected = {
            even.bg = lib.mkForce selection-background;
            odd.bg = lib.mkForce selection-background;
          };
          selected = {
            even.bg = lib.mkForce selection-background;
            odd.bg = lib.mkForce selection-background;
          };
        };
      };
  };
  stylix.targets.qutebrowser.enable = true;
}

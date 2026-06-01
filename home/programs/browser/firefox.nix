{ inputs, pkgs, ... }:
{
  programs.firefox = {
    enable = true;
    # package = pkgs.latest.firefox-nightly-bin;
    configPath = ".mozilla/firefox";
    profiles.default = {
      isDefault = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "browser.tabs.drawInTitlebar" = true;
        "svg.context-properties.content.enabled" = true;
      };
    };
  };
  stylix.targets.firefox = {
    enable = true;
    firefoxGnomeTheme.enable = true;
    profileNames = [ "default" ];
  };
}

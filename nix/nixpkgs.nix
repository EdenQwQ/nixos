{ self, ... }:
{
  nixpkgs = {
    config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        "openssl-1.1.1w"
        "electron-19.1.9"
        "electron-36.9.5"
      ];
      allowUnsupportedSystem = true;
    };
    overlays = builtins.attrValues self.overlays;
  };
}

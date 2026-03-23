{
  programs = {
    fish.enable = true;
    wshowkeys.enable = true;
    nix-ld.enable = true;
    virt-manager.enable = true;
    git = {
      enable = true;
      config = {
        safe = {
          directory = "*";
        };
      };
    };
  };
}

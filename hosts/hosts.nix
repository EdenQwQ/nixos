[
  {
    host = "eden-inspiron";
    user = "eden";
    extraOSModules = [ ./inspiron/os.nix ];
    extraHomeModules = [ ./inspiron/home.nix ];
    extraHomeArgs = {
      nixosVersion = "unstable";
      homeManagerVersion = "master";
    };
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKqbqHz5O4f6nBoki57c6hekVqUiO4hvSb9k771i61YS";
  }
  {
    host = "eden-xiaomi";
    user = "eden";
    extraOSModules = [ ./xiaomi/os.nix ];
    extraHomeModules = [ ./xiaomi/home.nix ];
    extraHomeArgs = {
      nixosVersion = "unstable";
      homeManagerVersion = "master";
    };
    publicKey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIDm0JDXe6XQF2KqUEk09QOVwJCDo2W+xQlADho0j+Jt1";
  }
]

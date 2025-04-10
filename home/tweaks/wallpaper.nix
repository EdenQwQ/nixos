{ pkgs, config, ... }:
{
  wallpapers = [
    {
      name = "mygo-watch-tv.png";
      convertMethod = "gonord";
    }
    {
      name = "frieren-butterflies.jpg";
      convertMethod = "lutgen";
    }
    {
      name = "frieren-butterflies-hydrogen.jpg";
      baseImageName = "frieren-butterflies";
      path = "${pkgs.wallpapers}/frieren-butterflies.jpg";
      convertMethod = "lutgen";
      effects = {
        hydrogen = {
          enable = true;
          options = {
            extraArguments = "--shadow-arguments '80x50+0+0' --background \"${config.lib.stylix.colors.withHashtag.base02}\"";
          };
        };
      };
    }
    {
      name = "frieren-fire.jpg";
      convertMethod = "lutgen";
    }
    {
      name = "anon-soyo.jpg";
      convertMethod = "gonord";
    }
    {
      name = "mygo-train.jpg";
      convertMethod = "gonord";
    }
    {
      name = "green-blue-flowers.jpg";
      convertMethod = "gonord";
    }
    {
      name = "bangqiaoyan-girl-sky.jpg";
      convertMethod = "gonord";
    }
    {
      name = "bangqiaoyan-girl-sky-hydrogen.jpg";
      baseImageName = "bangqiaoyan-girl-sky";
      path = "${pkgs.wallpapers}/bangqiaoyan-girl-sky.jpg";
      convertMethod = "gonord";
      effects = {
        hydrogen.enable = true;
        vignette.enable = true;
      };
    }
    {
      name = "morncolour-pink-landscape.png";
      convertMethod = "gonord";
    }
    {
      name = "jiaocha-girl-sea.jpg";
      convertMethod = "gonord";
    }
    {
      name = "muji-monochrome.jpg";
      convertMethod = "gonord";
    }
    {
      name = "zzzzoka-gbc.jpg";
      convertMethod = "gonord";
    }
  ];
}

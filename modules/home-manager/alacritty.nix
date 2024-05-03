{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.alacritty = {
    enable = lib.mkEnableOption "enable alacritty config module";
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env = {
          TERM = "alacritty";
        };
        window = {
          dimensions = {
            lines = 45;
            columns = 150;
          };
          padding = {
            x = 6;
            y = 6;
          };
          title = "Alacritty";
        };
      };
    };
  };
}

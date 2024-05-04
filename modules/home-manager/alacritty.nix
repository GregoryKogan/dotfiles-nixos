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
        live_config_reload = true;
        window = {
          dimensions = {
            lines = 45;
            columns = 150;
          };
          padding = {
            x = 6;
            y = 6;
          };
          dynamic_padding = true;
          title = "Alacritty";
          dynamic_title = false;
          opacity = 1.0;
        };
        scrolling = {
          history = 10000;
          multiplier = 3;
        };
        cursor = {
          style = {
            shape = "Beam";
            blinking = "Off";
          };
          thickness = 0.13;
        };
        mouse = {
          hide_when_typing = false;
        };
        font = {
          normal = {
            family = "JetBrainsMono Nerd Font";
            style = "Regular";
          };
          bold = {
            family = "JetBrainsMono Nerd Font";
          };
          italic = {
            family = "JetBrainsMono Nerd Font";
          };
          bold_italic = {
            family = "JetBrainsMono Nerd Font";
          };
          size = 13.0;
        };
        colors = {
          draw_bold_text_with_bright_colors = false;
          # Tokyo Night Storm theme
          primary = {
            background = "0x24283b";
            foreground = "0xc0caf5";
          };
          normal = {
            black = "0x1d202f";
            red = "0xf7768e";
            green = "0x9ece6a";
            yellow = "0xe0af68";
            blue = "0x7aa2f7";
            magenta = "0xbb9af7";
            cyan = "0x7dcfff";
            white = "0xa9b1d6";
          };
          bright = {
            black = "0x414868";
            red = "0xf7768e";
            green = "0x9ece6a";
            yellow = "0xe0af68";
            blue = "0x7aa2f7";
            magenta = "0xbb9af7";
            cyan = "0x7dcfff";
            white = "0xc0caf5";
          };
          indexed_colors = [
            {
              index = 16;
              color = "0xff9e64";
            }
            {
              index = 17;
              color = "0xdb4b4b";
            }
          ];
        };
      };
    };
  };
}

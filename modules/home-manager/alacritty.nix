{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.alacritty = {
    enable = lib.mkEnableOption "enable alacritty config module";

    theme = lib.mkOption {
      default = "gnome_terminal";
      description = ''
        color theme
      '';
    };
  };

  config = lib.mkIf config.alacritty.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        import = ["~/.config/alacritty/themes/${config.alacritty.theme}.toml"];
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
        };
      };
    };
  };
}

{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.nvim = {
    enable = lib.mkEnableOption "enable nvim config module";
  };

  config = lib.mkIf config.nvim.enable {
    home.file = {
      ".config/nvim/" = {
        source = ./configs;
        recursive = true;
      };
    };
  };
}

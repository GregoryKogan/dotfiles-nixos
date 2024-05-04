{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.nixvim = {
    enable = lib.mkEnableOption "enable nixvim config module";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;

      colorschemes.dracula.enable = true;
    };
  };
}

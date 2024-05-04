{
  lib,
  config,
  pkgs,
  ...
}: let
  cfg = config.fonts;
in {
  options.fonts = {
    enable = lib.mkEnableOption "enable fonts module";
  };

  config = lib.mkIf cfg.enable {
    home.packages = [
      (pkgs.nerdfonts.override {fonts = ["JetBrainsMono"];})
    ];
  };
}

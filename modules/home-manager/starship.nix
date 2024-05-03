{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.starship = {
    enable = lib.mkEnableOption "enable starship config module";
  };

  config = lib.mkIf config.starship.enable {
    programs.starship = {
      enable = true;
    };
  };
}

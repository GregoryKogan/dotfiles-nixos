{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.git = {
    enable = lib.mkEnableOption "enable git config module";
  };

  config = lib.mkIf config.git.enable {
    programs.git = {
      enable = true;
      userName = "GregoryKogan";
      userEmail = "grisha.koganovskiy@gmail.com";
    };
  };
}

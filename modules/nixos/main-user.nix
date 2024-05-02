{ lib, config, pkgs, ... }:

let
  cfg = config.main-user;
in
{
  options.main-user = {
    enable = lib.mkEnableOption "enable user module";

    username = lib.mkOption {
      default = "mainuser";
      description = ''
        username
      '';
    };

    description = lib.mkOption {
      default = "Main User";
      description = ''
        description
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    programs.zsh.enable = true;    
    users.users.${cfg.username} = {
      isNormalUser = true;
      initialPassword = "qw";
      extraGroups = [ "networkmanager" "wheel" ];
      description = cfg.description;
      shell = pkgs.zsh;
    };
  };
}

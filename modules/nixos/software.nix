{ lib, config, pkgs, ... }:

let
  cfg = config.software;
in
{
  options.software = {
    enable = lib.mkEnableOption "enable software module";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      wget
      git
      firefox
      neofetch
      zsh
      vim
      neovim
      alacritty
    ];
  };
}

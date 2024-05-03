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
      neofetch
      zsh
      vim
      neovim
      alacritty
      starship
      zoxide
      thefuck
      eza
    ];
  };
}

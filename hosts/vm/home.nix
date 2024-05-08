{
  osConfig,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/github-ssh.nix
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/nvim/module.nix
  ];

  home.username = osConfig.main-user.username;
  home.homeDirectory = "/home/${osConfig.main-user.username}";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    XCURSOR_THEME = "Adwaita";
  };

  git.enable = true;
  github-ssh.enable = true;
  fonts.enable = true;
  zsh.enable = true;
  alacritty = {
    enable = true;
    theme = "tokyo-night-storm";
  };
  starship.enable = true;
  nvim.enable = true;
}

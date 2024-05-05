{
  osConfig,
  inputs,
  pkgs,
  ...
}: {
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ../../modules/home-manager/git.nix
    ../../modules/home-manager/fonts.nix
    ../../modules/home-manager/zsh.nix
    ../../modules/home-manager/alacritty.nix
    ../../modules/home-manager/starship.nix
    ../../modules/home-manager/nixvim.nix
  ];

  home.username = osConfig.main-user.username;
  home.homeDirectory = "/home/${osConfig.main-user.username}";

  home.stateVersion = "23.11";
  programs.home-manager.enable = true;

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    pkgs.hello

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    # (pkgs.writeShellScriptBin "my-hello" ''
    #   echo "Hello, ${config.home.username}!"
    # '')
  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    ".config/alacritty/" = {
      # download alacritty themes
      source = builtins.fetchGit "https://github.com/alacritty/alacritty-theme";
      recursive = true;
    };

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  git.enable = true;
  fonts.enable = true;
  zsh.enable = true;
  alacritty = {
    enable = true;
    theme = "tokyo-night-storm";
  };
  starship.enable = true;
  nixvim.enable = true;
}

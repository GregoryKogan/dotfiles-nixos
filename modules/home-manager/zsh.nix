{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.zsh = {
    enable = lib.mkEnableOption "enable zsh config module";
  };

  config = lib.mkIf config.zsh.enable {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --impure --flake";
        addpkg = "vim ~/nixos/modules/nixos/software.nix";
        vim = "nvim";
        cd = "z";
        ls = "eza -TL=1 --icons";
        ls2 = "eza -TL=2 --icons";
      };

      oh-my-zsh = {
        enable = true;
        plugins = ["git" "thefuck" "zoxide" "starship"];
      };

      initExtra = ''
        colorscript --random
        echo 'Greetings master!'
      '';
    };
  };
}

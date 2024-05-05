{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.github-ssh = {
    enable = lib.mkEnableOption "enable github-ssh script module";
  };

  config = lib.mkIf config.github-ssh.enable {
    home.packages = [
      (pkgs.writeShellScriptBin "github-ssh" ''
        if [ ! -f ~/.ssh/id_ed25519.pub ]; then
          echo "~/.shh/id_ed25519.pub not found. Generating new ssh key..."
          read -p "Enter email: " email
          ssh-keygen -t ed25519 -C "$email"
          eval "$(ssh-agent -s)"
          ssh-add ~/.ssh/id_ed25519
        fi

        echo "SSH Public key: "
        cat ~/.ssh/id_ed25519.pub
      '')
    ];
  };
}

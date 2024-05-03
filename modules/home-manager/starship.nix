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
      enableZshIntegration = true;
      settings = {
        format = lib.concatStrings [
          "$cmd_duration "
          "$username "
          "$directory "
          "$git_branch "
          "$python"
          "$line_break"
          "$character"
        ];
        add_newline = false;
        character = {
          success_symbol = "[❱](bold red)[❱](bold green)[❱](bold blue)";
          error_symbol = "[❱](bold red)[❱](bold red)[❱](bold red)";
        };
        cmd_duration = {
          min_time = 5000;
          format = "took [$duration]($style)";
        };
        directory = {
          format = "[$path]($style)";
          truncation_length = 5;
          truncation_symbol = "../";
        };
        git_branch = {
          format = "on [$symbol$branch]($style)";
          style = "bold yellow";
        };
        python = {
          format = "[$symbol$version]($style)";
          style = "bold green";
        };
        username = {
          style_user = "bold dimmed blue";
          show_always = false;
        };
      };
    };
  };
}

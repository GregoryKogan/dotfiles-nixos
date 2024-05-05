{
  inputs,
  config,
  pkgs,
  lib,
  ...
}: {
  options.nixvim = {
    enable = lib.mkEnableOption "enable nixvim config module";
  };

  config = lib.mkIf config.nixvim.enable {
    programs.nixvim = {
      enable = true;
      enableMan = true;
      viAlias = true;
      vimAlias = true;
      defaultEditor = true;

      colorschemes.tokyonight.enable = true;

      clipboard = {
        register = "unnamedplus";
        providers.wl-copy.enable = true;
      };

      globals = {
        mapleader = " ";
      };

      opts = {
        autoindent = true;
        expandtab = true;
        breakindent = true;
        smartindent = true;

        autoread = true;
        colorcolumn = "120";
        updatetime = 100;

        number = true;
        relativenumber = true;

        undofile = true;
      };

      plugins = {
        telescope = {
          enable = true;
          keymaps = {
            "<C-p>" = {
              action = "git_files";
              options = { desc = "Telescope git files"; };
            };
            "<leader>fg" = "live_grep";
          };
        };
      };
    };
  };
}

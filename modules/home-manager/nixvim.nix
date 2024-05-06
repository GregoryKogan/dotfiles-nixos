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

      keymaps = [
        {
          # Toogle Neotree
          action = ":Neotree toggle<CR>";
          key = "<C-n>";
          options.silent = true;
        }
        {
          # Cycle through opened tabs
          action = ":BufferLineCycleNext<CR>";
          key = "<C-c>";
          options.silent = true;
        }
        {
          # Toggle ToggleTerm
          action = ":ToggleTerm<CR>";
          key = "<C-/>";
          options.silent = true;
        }
      ];

      opts = {
        autoindent = true;
        expandtab = true;
        tabstop = 2;
        softtabstop = 2;
        shiftwidth = 2;
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
              action = "find_files";
              options = {desc = "Telescope files";};
            };
            "<leader>fg" = "live_grep";
          };
        };
        treesitter = {
          enable = true;
          indent = true;
          ensureInstalled = [
            "nix"
            "bash"
            "python"
            "c"
            "cpp"
            "cmake"
            "javascript"
            "typescript"
            "vue"
            "dockerfile"
            "markdown"
          ];
        };
        neo-tree = {
          enable = true;
          enableGitStatus = true;
          enableModifiedMarkers = true;
        };
        lualine = {
          enable = true;
          theme = "auto";
        };
        bufferline = {
          enable = true;
          hover.enabled = true;
        };
        toggleterm = {
          enable = true;
          settings.direction = "vertical";
          settings.size = 50;
        };
        gitsigns = {
          enable = true;
        };
      };
    };
  };
}

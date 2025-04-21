{
  inputs,
  config,
  pkgs,
  ...
}: {
  home.stateVersion = "24.05";

  imports = [
    inputs.nvf.homeManagerModules.default
  ];

  home.packages = with pkgs; [
    superfile
  ];

  programs.nvf = {
    enable = true;
    settings.vim = {
      options = {
        shiftwidth = 2;
        tabstop = 8;
      };
      useSystemClipboard = true;
      languages = {
        clang = {
          enable = true;
          lsp.enable = true;
          treesitter.enable = true;
          dap.enable = true;
        };
        nix = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
          treesitter.enable = true;
        };
      };
      filetree.nvimTree.enable = true;
      telescope.enable = true;
      ui = {
        borders.enable = true;
        breadcrumbs.enable = true;
        colorizer.enable = true;
        fastaction.enable = true;
        illuminate.enable = true;
        modes-nvim.enable = true;
        noice.enable = true;
        smartcolumn.enable = true;
      };
      terminal.toggleterm.enable = true;
      statusline.lualine.enable = true;
      tabline.nvimBufferline.enable = true;
      formatter.conform-nvim.enable = true;
      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
      };
      git.enable = true;
      autopairs.nvim-autopairs.enable = true;
      notify.nvim-notify.enable = true;
      binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
      };
      #     theme = {
      #       enable = false;
      #       name = "catppuccin";
      #       style = "mocha";
      #     };
      debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };

      utility = {
        multicursors.enable = true;
        #        images.image-nvim.enable = true;
      };
    };
  };

  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    image = ./wallpaper.png;
    imageScalingMode = "fill";
    polarity = "dark";
    autoEnable = true;
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 24;
    };
    fonts = {
      monospace = {
        name = "Maple Mono NF";
        package = pkgs.maple-mono.NF;
      };
      serif = config.stylix.fonts.monospace;
      sansSerif = config.stylix.fonts.monospace;
      emoji = config.stylix.fonts.monospace;
      sizes = {
        desktop = 24;
        terminal = 24;
        applications = 24;
      };
    };
  };

  programs.fish.enable = true;

  nixpkgs.config.allowUnfree = true;
}

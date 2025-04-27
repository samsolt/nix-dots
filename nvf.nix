{
  enable = true;
  settings.vim = {
    options = {
      shiftwidth = 2;
      tabstop = 8;
    };
    useSystemClipboard = true;
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableLSP = true;
      enableTreesitter = true;

      clang.enable = true;
      nix.enable = true;
      markdown = {
        enable = true;
        extensions.render-markdown-nvim.enable = true;
      };
    };
    autocomplete = {
      enableSharedCmpSources = true;
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
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
}

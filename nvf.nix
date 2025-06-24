{
  enable = true;
  settings.vim = {
    options = {
      shiftwidth = 2;
      tabstop = 8;
    };
    clipboard = {
      enable = true;
      providers.wl-copy.enable = true;
      registers = "unnamedplus";
    };
    lsp.enable = true;
    languages = {
      enableDAP = true;
      enableExtraDiagnostics = true;
      enableFormat = true;
      enableTreesitter = true;

      clang.enable = true;
      nix.enable = true;
    };
    autocomplete = {
      enableSharedCmpSources = true;
      blink-cmp = {
        enable = true;
        friendly-snippets.enable = true;
      };
    };
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
    debugger.nvim-dap = {
      enable = true;
      ui.enable = true;
    };

    utility = {
      multicursors.enable = true;
    };
  };
}

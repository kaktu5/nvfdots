{
  config',
  pkgs,
  ...
}: {
  lsp = {
    formatOnSave = true;
    lsplines.enable = true;
  };
  autocomplete.nvim-cmp = {
    enable = true;
    mappings = {
      complete = null;
      confirm = "<C-y>";
      next = "<C-n>";
      previous = "<C-p>";
    };
  };
  snippets.luasnip.enable = true;
  visuals.fidget-nvim = {
    enable = true;
    setupOpts.notification.window.winblend = 0;
  };
  languages = {
    enableLSP = true;
    enableFormat = true;
    enableTreesitter = true;
    enableExtraDiagnostics = true;
    assembly.enable = true;
    bash.enable = config'.languages.assembly.enable;
    clang.enable = true;
    css.enable = true;
    haskell.enable = true;
    html.enable = true;
    lua = {enable = true;} // {lsp.lazydev.enable = true;};
    markdown.enable = true;
    nix = {enable = true;} // {lsp.server = "nixd";};
    nu.enable = true;
    ocaml.enable = true;
    rust = {enable = true;} // {crates.enable = true;};
    sql.enable = true;
    ts.enable = true;
    wgsl.enable = true;
    zig.enable = true;
  };
  extraPlugins.yuck-vim.package = pkgs.vimPlugins.yuck-vim;
}

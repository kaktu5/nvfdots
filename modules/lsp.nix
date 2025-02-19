{pkgs, ...}: let
  inherit (pkgs) makeWrapper nixd symlinkJoin;
  nixd' = symlinkJoin rec {
    name = "nixd";
    paths = [nixd];
    nativeBuildInputs = [makeWrapper];
    postBuild = ''
      wrapProgram $out/bin/${name} \
        --set NIXD_FLAGS "--inlay-hints=true"
    '';
  };
in {
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
    bash.enable = true;
    clang.enable = true;
    css.enable = true;
    haskell.enable = true;
    html.enable = true;
    lua = {enable = true;} // {lsp.lazydev.enable = true;};
    markdown.enable = true;
    nix = {enable = true;} // {lsp = {server = "nixd";} // {package = nixd';};};
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

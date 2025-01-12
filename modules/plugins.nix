{pkgs, ...}: {
  vim = {
    autopairs.nvim-autopairs.enable = true;
    git.vim-fugitive.enable = true;
    theme = {
      enable = true;
      name = "tokyonight";
      style = "night";
      transparent = true;
    };
    visuals = {
      highlight-undo.enable = true;
      nvim-cursorline.enable = true;
      nvim-web-devicons.enable = true;
    };
    extraPlugins = with pkgs.vimPlugins; {
      sort-nvim.package = sort-nvim;
      undotree.package = undotree;
      vim-smoothie.package = vim-smoothie;
      vim-tmux-navigator.package = vim-tmux-navigator;
    };
    maps.normal."<leader>u" = {
      action = "vim.cmd.UndotreeToggle";
      lua = true;
    };
  };
}

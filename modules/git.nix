_: {
  vim = {
    git = {
      enable = true;
      gitsigns.enable = true;
      vim-fugitive.enable = true;
    };
    maps.normal."<leader>gs" = {
      action = "vim.cmd.Git";
      lua = true;
    };
  };
}

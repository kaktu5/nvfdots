_: {
  vim = {
    git.gitsigns.enable = true;
    mini.git.enable = true;
    maps.normal."<leader>gs" = {
      action = "vim.cmd.Git";
      lua = true;
    };
  };
}

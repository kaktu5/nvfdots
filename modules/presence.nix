{pkgs, ...}: {
  vim.extraPlugins.presence-nvim = {
    package = pkgs.vimPlugins.presence-nvim;
    setup =
      # lua
      ''
        require("presence").setup({
          neovim_image_text = "Why would I exit Vim?",
          main_image = "file",
          buttons = false,
          show_time = true,
        })
      '';
  };
}

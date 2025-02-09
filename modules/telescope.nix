_: {
  telescope = {
    enable = true;
    mappings = {
      open = "<leader>pt";
      findFiles = "<leader>pf";
      liveGrep = "<leader>pg";
    };
    setupOpts.defaults = {
      borderchars = ["─" "│" "─" "│" "┌" "┐" "┘" "└"];
      file_ignore_patterns = [
        ".git/"
        ".lock"
        "build/"
        "dist/"
        "node_modules"
        "result/"
        "target/"
      ];
      prompt_prefix = ": ";
      selection_caret = "▌ ";
    };
  };
  highlight = let
    bg = "#000000";
    fg = "#c0caf5";
    ac = "#a485dd";
  in {
    TelescopeTitle = {inherit bg fg;};
    TelescopeBorder = {inherit bg fg;};
    TelescopeNormal = {inherit bg fg;};
    TelescopeMatching = {inherit bg;} // {fg = ac;};
    TelescopeMultiIcon = {inherit bg;} // {fg = ac;};
    TelescopeSelection = {inherit bg;} // {fg = ac;};
    TelescopePreviewDate = {inherit bg fg;};
    TelescopePreviewLine = {inherit bg fg;};
    TelescopePreviewLink = {inherit bg fg;};
    TelescopePreviewPipe = {inherit bg fg;};
    TelescopePreviewRead = {inherit bg fg;};
    TelescopePreviewSize = {inherit bg fg;};
    TelescopePreviewUser = {inherit bg fg;};
    TelescopePromptTitle = {inherit bg fg;};
    TelescopePreviewBlock = {inherit bg fg;};
    TelescopePreviewGroup = {inherit bg fg;};
    TelescopePreviewMatch = {inherit bg;} // {fg = ac;};
    TelescopePreviewTitle = {inherit bg fg;};
    TelescopePreviewWrite = {inherit bg fg;};
    TelescopePromptBorder = {inherit bg fg;};
    TelescopePromptNormal = {inherit bg fg;};
    TelescopePromptPrefix = {inherit bg fg;};
    TelescopePreviewBorder = {inherit bg fg;};
    TelescopePreviewHyphen = {inherit bg fg;};
    TelescopePreviewNormal = {inherit bg fg;};
    TelescopePreviewSocket = {inherit bg fg;};
    TelescopePreviewSticky = {inherit bg fg;};
    TelescopePromptCounter = {inherit bg fg;};
    TelescopeMultiSelection = {inherit bg fg;};
    TelescopePreviewCharDev = {inherit bg fg;};
    TelescopePreviewExecute = {inherit bg fg;};
    TelescopePreviewMessage = {inherit bg fg;};
    TelescopeSelectionCaret = {inherit bg;} // {fg = ac;};
    TelescopePreviewDirectory = {inherit bg fg;};
    TelescopePreviewMessageFillchar = {inherit bg fg;};
  };
}

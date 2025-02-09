{lib, ...}: let
  inherit (lib.kkts) mkLuaExpr;
  statusline = ''require("mini.statusline")'';
in {
  mini.statusline = {
    enable = true;
    setupOpts.content.active =
      mkLuaExpr
      # lua
      ''
        function()
          local mode, mode_hl = ${statusline}.section_mode({ trunc_width = 120 })
          local git = ${statusline}.section_git({ trunc_width = 40 })
          local diff = ${statusline}.section_diff({ trunc_width = 60 })
          local diagnostics = ${statusline}.section_diagnostics({ trunc_width = 75 })
          local filename = ${statusline}.section_filename({ trunc_width = 140 })
          local location = function()
            return "%l:%v"
          end
          local search = ${statusline}.section_searchcount({ trunc_width = 75 })

          return ${statusline}.combine_groups({
            { hl = mode_hl, strings = { mode } },
            '%<',
            { hl = 'MiniStatuslineInfo', strings = { filename, git, diff } },
            '%=',
            { hl = 'MiniStatuslineInfo', strings = { diagnostics } },
            { hl = mode_hl, strings = { search, location() } },
          })
        end
      '';
  };
  highlight = let
    fg = "#000000";
  in {
    MiniStatuslineModeNormal = {bg = "#a485dd";} // {inherit fg;};
    MiniStatuslineModeInsert = {bg = "#95c561";} // {inherit fg;};
    MiniStatuslineModeVisual = {bg = "#9fbbf3";} // {inherit fg;};
    MiniStatuslineModeReplace = {bg = "#ee6d85";} // {inherit fg;};
    MiniStatuslineModeCommand = {bg = "#f6955b";} // {inherit fg;};
    MiniStatuslineModeOther = {bg = "#f6955b";} // {inherit fg;};
    MiniStatuslineInactive = {bg = "#000000";} // {fg = "#c0caf5";};
    MiniStatuslineInfo = {fg = "#c0caf5";} // {bg = "#000000";};
  };
}

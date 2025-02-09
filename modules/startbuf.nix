{lib, ...}: let
  inherit (lib.kkts) mkLuaExprs;
  starter = ''require("mini.starter")'';
in {
  mini.starter = {
    enable = true;
    setupOpts = {
      items = mkLuaExprs [
        "${starter}.sections.recent_files(8, true)"
        "${starter}.sections.builtin_actions()"
      ];
      content_hooks = mkLuaExprs [
        ''${starter}.gen_hook.adding_bullet("│ ")''
        ''${starter}.gen_hook.aligning("center", "center")''
      ];
      footer = "";
    };
  };
  highlight = let
    bg = "#000000";
    fg = "#c0caf5";
    ac = "#a485dd";
  in {
    MiniStarterCurrent = {inherit bg fg;};
    MiniStarterFooter = {inherit bg fg;};
    MiniStarterHeader = {inherit bg;} // {fg = ac;};
    MiniStarterInactive = {inherit bg fg;};
    MiniStarterItem = {inherit bg fg;};
    MiniStarterItemBullet = {inherit bg;} // {fg = ac;};
    MiniStarterItemPrefix = {inherit bg;} // {fg = ac;};
    MiniStarterSection = {inherit bg;} // {fg = ac;};
    MiniStarterQuery = {inherit bg;} // {fg = ac;};
  };
}

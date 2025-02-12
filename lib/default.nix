{
  kkts = {
    mkHl = bg: fg: blend: {inherit bg fg blend;};
    mkLuaExpr = expr: {
      inherit expr;
      _type = "lua-inline";
    };
  };
}

let
  inherit (builtins) map;
in {
  kkts = {
    mkLuaExpr = expr: {
      inherit expr;
      _type = "lua-inline";
    };
    mkLuaExprs = exprs: (map (expr: {
        inherit expr;
        _type = "lua-inline";
      })
      exprs);
  };
}

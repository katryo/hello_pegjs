start = Expr+
Expr = expr:(pageBlock / Symbol ) _ {
  return expr;
}

pageBlock = child:(_ expr:ExprInsidePage _ {return expr})* "[page]" {
  return child;
}

ExprInsidePage = expr:(seTag / Symbol ) _ {
  return expr;
}

_ = (Whitespace / LineTerminator)*
Whitespace = [\t\v\f \u00A0\uFEFF]
LineTerminator = [\n\r\u2028\u2029]

Symbol = $([a-zA-Z] [a-zA-Z0-9] *)

seTag = "[se" _ name:Symbol "]" {
  return { se: name };
}

bgmTag = "[bgm" _ name:Symbol "]" {
  return name;
}

filterTag = "[filter" _ name:Symbol "]" {
  return name;
}

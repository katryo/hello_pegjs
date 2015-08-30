start = Expr+
Expr = expr:(pageBlock / seBlock / seBlockStartsWithBracket / Symbol ) _ {
  return expr;
}

pageBlock = child:(_ expr:ExprInsidePage _ {return expr})* "[page]" {
  return child;
}

ExprInsidePage = expr:(seBlock / seBlockStartsWithBracket / Symbol ) _ {
  return expr;
}

seBlock = symbol:Symbol child:(_ expr:ExprInsidePage _ {return expr})* se:seTag {
  return { content: symbol + child , se: se};
}

seBlockStartsWithBracket =  se:seTag {
  return {se: se};
}

_ = (Whitespace / LineTerminator)*
Whitespace = [\t\v\f \u00A0\uFEFF]
LineTerminator = [\n\r\u2028\u2029]

Symbol = $([a-zA-Z] [a-zA-Z0-9] *)

seTag = "[se" _ name:Symbol "]" {
  return name;
}

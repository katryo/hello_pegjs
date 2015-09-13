start
= Expr+

Expr
= expr:(pageBlock / Symbol ) _ {
  return expr;
}

pageBlock
= child:(_ expr:ExprInsidePage _ {return expr})* "[page]" {
  return child;
}

ExprInsidePage
= expr:(SeTag / BgmTag / FilterTag / StringEndsWithBrace / Symbol) _ {
  return expr;
}

_ = (WhiteSpace / LineTerminator)*
WhiteSpace = [\t\v\f \u00A0\uFEFF]
LineTerminator = [\n\r\u2028\u2029]

Symbol = $([a-zA-Z] [a-zA-Z0-9]* )


StringEndsWithBrace = $(.+ "[")
String = c:$( !"[" SourceCharacter + !"]") { return c;}

Unescaped = $([\x20-\x5A\x5E-\u10FFFF] *)
SourceCharacter
  = .

SeTag = "[se" _ name:Symbol "]" {
  return { se: name };
}

BgmTag = "[bgm" _ name:Symbol "]" {
  return { bgm: name };
}

FilterTag = "[filter" _ name:Symbol "]" {
  return { filter: name };
}

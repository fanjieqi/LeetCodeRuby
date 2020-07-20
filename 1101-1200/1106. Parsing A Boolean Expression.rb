NOT_TRUE = /\!\(t\)/
NOT_FALSE = /\!\(f\)/
OR_EXP = /\|\([ft\,]+\)/
AND_EXP = /\&\([ft\,]+\)/

# @param {String} expression
# @return {Boolean}
def parse_bool_expr(expression)
  while expression[/[\||\&|\!]/]
    expression.gsub!(NOT_TRUE, 'f') while expression[NOT_TRUE]
    expression.gsub!(NOT_FALSE, 't') while expression[NOT_FALSE]
    expression.sub!(OR_EXP, expression[OR_EXP]['t'] || 'f') while expression[OR_EXP]
    expression.sub!(AND_EXP, expression[AND_EXP]['f'] || 't') while expression[AND_EXP]
  end
  expression.gsub!('f', 'false')
  expression.gsub!('t', 'true')
  eval(expression)
end

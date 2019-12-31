# @param {String[]} tokens
# @return {Integer}
def eval_rpn(tokens)
  return tokens[0].to_i if tokens.length == 1
  stack = []
  tokens.each do |token|
    if %w(+ - * /).include?(token)
      a = stack.pop
      b = stack.pop
      p a if token == "/" && a == -132
      case token
      when "+" then stack << b + a
      when "-" then stack << b - a
      when "*" then stack << b * a
      when "/" 
        result = b / a.to_f
        stack << (result < 0 ? result.ceil : result.floor)
      end
    else
      stack << token.to_i
    end
  end
  stack.pop.to_i
end

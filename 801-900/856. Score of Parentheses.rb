# @param {String} s
# @return {Integer}
def score_of_parentheses(s)
  stack = []
  s.each_char do |char|
    if char == "("
      stack << char
    elsif char == ")"
      if stack.last == "("
        tmp = 1
        stack.pop
        tmp += stack.pop while !stack.empty? && stack.last != "("
        stack << tmp
      else
        tmp = stack.pop
        if !stack.empty? && stack.last == "("
          stack.pop
          tmp *= 2
        end
        tmp += stack.pop while !stack.empty? && stack.last != "("
        stack << tmp
      end
    end
  end
  stack.last
end

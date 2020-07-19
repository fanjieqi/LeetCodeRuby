# @param {String} expression
# @return {String[]}
def brace_expansion_ii(expression)
  stack = []
  expression.each_char do |char|
    if char == '{'
      stack << '{'
    elsif char == '}'
      while stack[-2] == ','
        set2 = stack.pop()
        stack.pop()
        stack[-1] |= set2
      end
      tail = stack.pop()
      stack[-1] = tail
    elsif char == ','
      stack << ','
    else
      stack << [char]
    end
    while stack.size > 1 && stack[-1].is_a?(Array) && stack[-2].is_a?(Array)
      set2 = stack.pop()
      set1 = stack.pop()
      set = []
      set1.each do |w1|
        set2.each do |w2|
          set << w1 + w2
        end
      end
      stack << set.uniq
    end
  end
  stack[-1].uniq.sort
end

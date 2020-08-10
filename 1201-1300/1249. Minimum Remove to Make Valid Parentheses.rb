# @param {String} s
# @return {String}
def min_remove_to_make_valid(s)
  stack = []
  (0..s.size-1).each do |i|
    if s[i] == ')' && stack[-1] && s[stack[-1]] == '('
      stack.pop
    elsif s[i] == ')' || s[i] == '('
      stack << i
    end
  end
  (stack.size-1).downto(0) { |i| s.slice!(stack[i]) }
  s
end

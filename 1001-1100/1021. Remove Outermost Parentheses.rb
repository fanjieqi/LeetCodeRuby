# @param {String} s
# @return {String}
def remove_outer_parentheses(s)
  ans, k = [], 0
  s.each_char do |char|
    ans << char if char == '(' && k > 0 || char == ')' && k > 1
    k += (char == '(' ? 1 : -1)
  end
  ans.join
end

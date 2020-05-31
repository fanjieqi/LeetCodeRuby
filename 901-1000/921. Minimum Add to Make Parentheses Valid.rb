# @param {String} s
# @return {Integer}
def min_add_to_make_valid(s)
  stack = []
  s.each_char do |char|
    if stack[-1] == "(" && char == ")"
      stack.pop
    else
      stack << char
    end
  end
  stack.size
end

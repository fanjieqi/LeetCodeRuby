OK = [
  ["(", ")"],
  ["[", "]"],
  ["{", "}"]
]

NOT_OK = [
  ["(", "]"],
  ["(", "}"],
  ["[", ")"],
  ["[", "}"],
  ["{", ")"],
  ["{", "]"]
]

# @param {String} s
# @return {Boolean}
def is_valid(s)
  stack = [s[0]]
  rest = s.split("")[1..-1]
  rest.each do |ele|
    if OK.include?([stack.last, ele])
      stack = stack[0..-2]
    elsif NOT_OK.include?([stack.last, ele])
      return false
    else
      stack << ele
    end
  end if rest
  stack.compact.empty?
end

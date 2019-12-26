OK = [
  ["(", ")"],
  ["[", "]"],
  ["{", "}"]
]

# @param {String} s
# @return {Integer}
def longest_valid_parentheses(s)
  stack = []
  indexes = []
  rest = s.split("")[0..-1]
  rest.each_with_index do |ele, i|
    if OK.include?([stack.last, ele])
      stack.pop
      indexes.pop
    else
      stack << ele
      indexes << i
    end
  end if rest

  indexes.each { |index| s[index] = " " }
  s.split(" ").map(&:length).max.to_i
end

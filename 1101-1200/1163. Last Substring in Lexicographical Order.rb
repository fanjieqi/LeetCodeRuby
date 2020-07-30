# @param {String} s
# @return {String}
def last_substring(s)
  chars = s.chars.uniq.sort
  return s if chars.size == 1
  char = chars.last
  indexes = []
  i = -1
  indexes << i while i = s.index(char, i+1)

  offset = 1
  stack = []
  loop do
    indexes.each do |i|
      if stack.empty?
        stack << i
      elsif s[i+offset].nil? || s[i+offset] < s[stack[-1]+offset] || stack.bsearch { |j| j+offset >= i }
        next
      else
        stack = [] if stack.size > 0 && s[i+offset] > s[stack[-1]+offset]
        stack << i
      end
    end
    break if stack.size == 1
    offset += 1
    indexes = stack
    stack = []
  end
  s[stack[-1]..-1]
end

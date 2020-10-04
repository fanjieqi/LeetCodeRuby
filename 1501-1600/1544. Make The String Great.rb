# @param {String} s
# @return {String}
def make_good(s)
  chars = ('a'..'z').zip('A'..'Z').map(&:join) + ('A'..'Z').zip('a'..'z').map(&:join)
  while tmp = chars.find { |char| s[char] }
    s.gsub!(tmp, '')
  end
  s
end

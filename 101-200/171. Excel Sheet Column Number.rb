CHARS = ('A'..'Z').map.with_index { |char, i| [char, i+1]  }.to_h
# @param {String} s
# @return {Integer}
def title_to_number(s)
  ans = 0
  (s.length-1).downto(0) do |i|
    ans += CHARS[s[i]] * 26**(s.length-1-i)
  end
  ans
end

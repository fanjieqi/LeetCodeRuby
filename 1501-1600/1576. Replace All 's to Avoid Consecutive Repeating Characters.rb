# @param {String} s
# @return {String}
def modify_string(s)
  (0..s.size-1).each do |i|
    next if s[i] != '?'
    ('a'..'z').each do |char|
      next if i > 0 && s[i-1] == char || i < s.size-1 && char == s[i+1]
      s[i] = char
      break
    end
  end
  s
end

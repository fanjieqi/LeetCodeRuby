# @param {String} s
# @return {String}
def reverse_parentheses(s)
  while tmp = s[/\(\w*\)/]
    s.gsub!(tmp, tmp.reverse[1..-2]) 
  end
  s
end

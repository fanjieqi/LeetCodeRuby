# @param {String} s
# @return {Boolean}
def valid_palindrome(s)
  s = s.split("")
  while s.size > 0 && s[0] == s[-1]
    s.shift
    s.pop
  end
  s.size == 0 || s[0..-2] == s[0..-2].reverse || s[1..-1] == s[1..-1].reverse
end

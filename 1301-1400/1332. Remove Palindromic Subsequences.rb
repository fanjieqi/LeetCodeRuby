# @param {String} s
# @return {Integer}
def remove_palindrome_sub(s)
  s.empty? ? 0 : (s.reverse == s ? 1 : 2)
end

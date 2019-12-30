# @param {String} s
# @return {Boolean}
def is_palindrome(s)
  s = s.scan(/\w/).map(&:downcase)
  (0..s.length / 2).all? { |i| s[i] == s[s.length - i - 1]}
end

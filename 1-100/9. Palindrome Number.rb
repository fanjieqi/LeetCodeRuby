# @param {Integer} x
# @return {Boolean}
def is_palindrome(x)
  x >= 0 && x.to_s.reverse == x.to_s
end

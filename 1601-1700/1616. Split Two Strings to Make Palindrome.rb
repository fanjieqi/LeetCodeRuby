# @param {String} a
# @param {String} b
# @return {Boolean}
def check_palindrome_formation(a, b)
  l, r = 0, a.size-1
  while l < r && a[l] == b[r]
    l += 1
    r -= 1
  end
  s1, s2 = a[l..r], b[l..r]

  l, r = 0, a.size-1
  while l < r && b[l] == a[r]
    l += 1
    r -= 1
  end
  s3, s4 = a[l..r], b[l..r]

  return s1 == s1.reverse || s2 == s2.reverse || s3 == s3.reverse || s4 == s4.reverse
end

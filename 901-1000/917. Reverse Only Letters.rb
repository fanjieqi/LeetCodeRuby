# @param {String} s
# @return {String}
def reverse_only_letters(s)
  l, r = 0, s.size - 1
  while l < r
    l += 1 while l < s.size-1 && !s[l][/[a-zA-Z]/]
    r -= 1 while r > 0 && !s[r][/[a-zA-Z]/]
    break if l >= r
    s[l], s[r] = s[r], s[l]
    l += 1
    r -= 1
  end
  s
end

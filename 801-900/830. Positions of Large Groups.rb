# @param {String} s
# @return {Integer[][]}
def large_group_positions(s)
  l, ans = 0, []
  while l < s.size
    r = l
    r += 1 while r+1 < s.size && s[r+1] == s[l]
    if r-l >= 2
      ans << [l, r]
      l = r+1
    else
      l += 1
    end
  end
  ans
end

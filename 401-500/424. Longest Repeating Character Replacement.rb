# @param {String} s
# @param {Integer} k
# @return {Integer}
def character_replacement(s, k)
  m = {}
  count, l, r, d = 0, 0, 0, 0
  while r < s.size()
    m[s[r]] ||= 0
    m[s[r]] += 1
    count = m[s[r]] if (m[s[r]] > count)
    r += 1
    if (r - l - count > k)
      m[s[l]] -= 1
      l += 1
    end
  end
  r - l
end

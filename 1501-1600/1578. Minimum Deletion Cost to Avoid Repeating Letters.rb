# @param {String} s
# @param {Integer[]} cost
# @return {Integer}
def min_cost(s, cost)
  l = 0
  ans = 0
  while l < s.size
    l += 1 while l < s.size && s[l] != s[l+1]
    r = l
    r += 1 while r < s.size && s[r] == s[r+1]
    ans += (cost[l..r].sum.to_i - cost[l..r].max.to_i)
    l = r + 1
  end
  ans
end

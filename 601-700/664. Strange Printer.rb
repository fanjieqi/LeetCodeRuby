def dfs(l, r)
  return 0 if l > r
  return @hash[[l, r]] if @hash[[l, r]]
  ans = dfs(l+1, r) + 1
  (l+1..r).each do |k|
    ans = [ans, dfs(l, k-1) + dfs(k+1, r)].min if @s[k] == @s[l]
  end
  @hash[[l, r]] = ans
end

# @param {String} s
# @return {Integer}
def strange_printer(s)
  @s = s
  @hash = {}
  dfs(0, s.length - 1)
end

def dfs(n)
  return n if n <= 1
  return @hash[n] if @hash[n]
  return @hash[n] = 1 + [n % 2 + dfs(n / 2), n % 3 + dfs(n / 3)].min
end

# @param {Integer} n
# @return {Integer}
def min_days(n)
  @hash = {}
  dfs(n)
end

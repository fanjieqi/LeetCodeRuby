def dfs(a, b)
  return 0.5 if a <= 0 && b <= 0
  return 1 if a <= 0
  return 0 if b <= 0
  @hash[[a,b]] ||= 0.25 * (dfs(a - 100, b) + dfs(a - 75, b - 25) + dfs(a - 50, b - 50) + dfs(a - 25, b - 75))
  @hash[[a,b]]
end

# @param {Integer} n
# @return {Float}
def soup_servings(n)
  @hash = {}
  n >= 4800 ? 1.0 : dfs(n, n)
end

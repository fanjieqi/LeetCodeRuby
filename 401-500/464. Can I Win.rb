def dfs(m, t, k)
  return @hash[k] if @hash[k]
  return false if t <= 0
  @hash[k] = (0..m-1).any? { |i| (k&(1<<i)).zero? && !dfs(m, t-i-1, k|(1<<i)) }
end

# @param {Integer} m
# @param {Integer} t
# @return {Boolean}
def can_i_win(m, t)
  return true if t < 2
  return false if (1 + m) * m/2 < t
  @hash = {}
  dfs(m, t, 0)
end

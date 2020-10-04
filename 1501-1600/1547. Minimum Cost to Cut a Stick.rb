def dfs(l, r)
  return @hash[l][r] if @hash.dig(l, r)
  @hash[l] ||= {}
  return @hash[l][r] = @sticks[r] - @sticks[l] if l + 1 == r
  @hash[l][r] = nil
  basic = @sticks[r] - @sticks[l]
  (l+1..r-1).each do |mid|
    tmp = basic + dfs(l, mid) + dfs(mid, r)
    @hash[l][r] = tmp if @hash[l][r].nil? || tmp < @hash[l][r]
  end
  @hash[l][r]
end

# @param {Integer} n
# @param {Integer[]} cuts
# @return {Integer}
def min_cost(n, cuts)
  @hash = {}
  @sticks = [0] + cuts.sort + [n]
  dfs(0, @sticks.size-1)
  @hash[0][@sticks.size-1] - n
end

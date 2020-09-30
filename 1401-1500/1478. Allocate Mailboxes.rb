def dfs(l, r, k)
  return 0 if l >= r && k >= 1
  return @hash[l][r][k] if @hash.dig(l, r, k)
  @hash[l] ||= {}
  @hash[l][r] ||= {}
  return @hash[l][r][k] = @houses[r] - @houses[l] if r - l <= 2 && k == 1
  @hash[l][r][k] = @houses[r] - @houses[l] + (@hash.dig(l+1, r-1, 1) || dfs(l+1, r-1, 1))
  (1..k-1).each do |kk|
    (l..r-1).each do |mid|
      left = dfs(l, mid, kk)
      break if left >= @hash[l][r][k]
      right = dfs(mid+1, r, k-kk)
      break if right >= @hash[l][r][k]
      tmp = left + right
      @hash[l][r][k] = tmp if tmp < @hash[l][r][k]
    end
  end
  @hash[l][r][k]
end

# @param {Integer[]} houses
# @param {Integer} k
# @return {Integer}
def min_distance(houses, k)
  @houses, @n, @k, @hash = houses.sort, houses.size, k, []
  dfs(0, @n-1, k)
end

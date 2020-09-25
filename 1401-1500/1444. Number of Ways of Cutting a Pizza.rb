MOD = 10**9 + 7

def dfs(k, r, c)
  return @hash[k][r][c] if @hash.dig(k, r, c)
  return 0 if @preSum[r][c] == 0
  return 1 if k == 0
  sum = 0
  (r+1..@m-1).each do |nr|
    sum += dfs(k-1, nr, c) if @preSum[r][c] - @preSum[nr][c] > 0
  end
  (c+1..@n-1).each do |nc|
    sum += dfs(k-1, r, nc) if @preSum[r][c] - @preSum[r][nc] > 0
  end
  @hash[k] ||= []
  @hash[k][r] ||= []
  @hash[k][r][c] = sum % MOD
end

# @param {String[]} pizza
# @param {Integer} k
# @return {Integer}
def ways(pizza, k)
  @m, @n = pizza.size, pizza[0].size

  @preSum = []
  (@m-1).downto(0) do |r|
    @preSum[r] ||= []
    (@n-1).downto(0) do |c|
      @preSum[r][c] = @preSum.dig(r, c+1).to_i + @preSum.dig(r+1, c).to_i - @preSum.dig(r+1, c+1).to_i + (pizza[r][c] == 'A' ? 1 : 0)
    end
  end

  @hash = []
  dfs(k-1, 0, 0)
end

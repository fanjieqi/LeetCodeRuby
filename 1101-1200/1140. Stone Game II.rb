def dfs(i, m)
  return @piles[i] if i + 2 * m >= @n
  return @hash[i][m] if @hash.dig(i, m)
  @hash[i] ||= {}
  min = 1 << 31
  (1..2*m).each do |j| 
    tmp = dfs(i + j, [m, j].max)
    min = tmp if tmp < min
  end
  @hash[i][m] = @piles[i] - min
end

# @param {Integer[]} piles
# @return {Integer}
def stone_game_ii(piles)
  @piles, @n = piles, piles.size
  (@n-2).downto(0) { |i| piles[i] += piles[i + 1]}
  @hash = {}
  dfs(0, 1)
end

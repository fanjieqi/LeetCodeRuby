# @param {Integer[]} stones
# @return {String}
def stone_game_iii(stones)
  n = stones.size
  f = [0] * 3
  (n-1).downto(0) do |i|
    f[i%3] = [1, 2, 3].map { |k| stones[i,k].sum - f[(i+k)%3] }.max
  end
  f[0] == 0 ? 'Tie' : (f[0] > 0 ? 'Alice' : 'Bob')
end

# @param {Integer[]} stones
# @return {Integer[]}
def num_moves_stones_ii(stones)
  stones.sort!
  i, n, low = 0, stones.size, stones.size
  high = [stones[-1] - n + 2 - stones[1], stones[-2] - stones[0] - n + 2].max
  (0..n-1).each do |j|
    i += 1 while stones[j] - stones[i] >= n
    if j - i + 1 == n - 1 && stones[j] - stones[i] == n - 2
      low = [low, 2].min
    else
      low = [low, n - (j - i + 1)].min
    end
  end
  [low, high]
end

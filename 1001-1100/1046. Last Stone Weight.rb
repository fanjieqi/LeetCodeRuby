# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight(stones)
  stones.sort!
  while stones.size > 1
    w1, w2 = stones.pop, stones.pop
    next if w1 == w2
    w = w1 - w2
    i = stones.bsearch_index { |ele| ele >= w } || stones.size
    stones.insert(i, w)
  end
  stones[0] || 0
end

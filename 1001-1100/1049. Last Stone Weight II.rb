# @param {Integer[]} stones
# @return {Integer}
def last_stone_weight_ii(stones)
  hash = {0 => true}
  sumA = stones.sum
  stones.each do |stone|
    hash.keys.each do |i|
      hash[stone+i] = true
    end
  end
  hash.map { |i, _| (sumA - i - i).abs }.min
end

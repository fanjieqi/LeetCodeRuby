# @param {Integer[]} chips
# @return {Integer}
def min_cost_to_move_chips(chips)
  positions = chips.inject({}) { |hash, position| hash.merge(position => hash[position].to_i + 1) }
  positions.keys.map do |i|
    positions.inject(0) do |sum, (j, count)|
      sum += (j-i).abs.odd? ? 1 * count : 0
    end
  end.min
end

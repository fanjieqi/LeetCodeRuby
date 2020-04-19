MAX = 1 << 31
# @param {Integer[]} fronts
# @param {Integer[]} backs
# @return {Integer}
def flipgame(fronts, backs)
  hash = {}
  fronts.each_with_index { |num, i| hash[num] = true if fronts[i] == backs[i] }
  min = MAX
  fronts.size.times do |i|
    min = backs[i] if hash[backs[i]].nil? && backs[i] < min
    min = fronts[i] if hash[fronts[i]].nil? && fronts[i] < min
  end
  min == MAX ? 0 : min
end

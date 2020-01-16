# @param {Integer[]} stones
# @return {Boolean}
def can_cross(stones)
  return stones[1] - stones[0] == 1 if stones.length == 2
  return false if stones[1] - stones[0] > 1
  f = [nil, {1 => true}]
  (2..stones.length - 1).each do |i|
    f[i] = {}
    (1..i-1).each do |j|
      k = stones[i] - stones[j]
      f[i][k] = true if f[j][k] || f[j][k-1] || f[j][k+1]
    end
  end
  !f.last.empty?
end

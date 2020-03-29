# @param {Integer[]} cost
# @return {Integer}
def min_cost_climbing_stairs(cost)
  return cost.min.to_i if cost.size <= 2
  f = cost[0..1]
  (2..cost.size-1).each do |i|
    f[i] = [f[i-1], f[i-2]].min + cost[i]
  end
  f[-2..-1].min
end

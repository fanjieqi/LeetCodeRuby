# @param {Integer[]} gas
# @param {Integer[]} cost
# @return {Integer}
def can_complete_circuit(gas, cost)
  return -1 if gas.length == 0 || cost.length == 0
  len = gas.length
  gas += gas
  cost += cost

  (0..len-1).each do |i|
    sum = gas[i]
    flag = true
    (i+1..len+i).each do |j|
      if sum < cost[j-1]
        flag = false
        break
      end
      sum -= cost[j-1]
      sum += gas[j]
    end
    return i if sum >= 0 && flag
  end
  -1
end

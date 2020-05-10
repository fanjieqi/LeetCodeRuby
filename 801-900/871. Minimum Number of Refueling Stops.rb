# @param {Integer} target
# @param {Integer} start_fuel
# @param {Integer[][]} stations
# @return {Integer}
def min_refuel_stops(target, start_fuel, stations)
  res, i, cur, array = 0, 0, start_fuel, []
  while cur < target
    while i < stations.size && stations[i][0] <= cur
      j = array.bsearch_index { |ele| ele >= -stations[i][1] } || -1
      array.insert(j, -stations[i][1])
      i += 1
    end
    return -1 if array.empty?
    cur += -array.shift
    res += 1
  end
  res
end

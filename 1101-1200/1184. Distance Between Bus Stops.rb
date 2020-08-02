# @param {Integer[]} distance
# @param {Integer} start
# @param {Integer} destination
# @return {Integer}
def distance_between_bus_stops(distance, start, destination)
  n = distance.size
  start, destination = destination, start if start > destination
  sum = [0]
  (1..n).each { |i| sum[i] = sum[i-1] + distance[i-1] }
  [sum[destination] - sum[start], sum[start] + sum[n] - sum[destination]].min
end

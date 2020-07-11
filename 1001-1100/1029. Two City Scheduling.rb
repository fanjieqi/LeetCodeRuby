# @param {Integer[][]} costs
# @return {Integer}
def two_city_sched_cost(costs)
  array, n = [], costs.size / 2
  min = 0
  costs.each do |a, b|
    array << b - a
    min += a
  end
  array.sort!
  min += array[0,n].sum
end

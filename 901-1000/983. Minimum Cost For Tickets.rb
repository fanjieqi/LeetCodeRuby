def dfs(i, total)
  return if total >= @min || @hash[i] && total >= @hash[i]
  @hash[i] = total
  return @min = total if i >= @days.size
  @costs.each do |cost, day|
    tmp = @days[i] + day
    j = @days.bsearch_index { |ele| ele >= tmp } || @days.size
    dfs(j, total+cost)
  end
end

# @param {Integer[]} days
# @param {Integer[]} costs
# @return {Integer}
def mincost_tickets(days, costs)
  @days, @costs = days, costs.zip([1, 7, 30])
  @min, @hash= @days.size*costs[0], []
  dfs(0, 0)
  @min
end

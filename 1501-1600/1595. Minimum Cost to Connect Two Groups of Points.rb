def dfs(i, cur, from)
  @cost[i].each_with_index do |tmp, j|
    state = cur | (1 << j)
    cost = @hash[from][cur] + @cost[i][j]
    next if @hash[i][state] && cost >= @hash[i][state] || @hash[i][@key] && cost > @hash[i][@key]
    @hash[i][state] = cost
    dfs(i, state, i)
  end
end

# @param {Integer[][]} cost
# @return {Integer}
def connect_two_groups(cost)
  @cost, @n, @m, @hash = cost, cost.size, cost[0].size, { -1 => {0 => 0} }
  @key = (1 << @m) - 1

  (0..@n-1).each do |i|
    @hash[i] = {}
    @hash[i-1].each { |cur, total| dfs(i, cur, i-1) }
  end
  @hash[@n-1][@key]
end

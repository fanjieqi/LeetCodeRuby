def dfs(u, s)
  return 0 if u.nil?
  sum = @hash[u] ? 2 : 0
  @map[u]&.each do |v|
    sum += dfs(v, u) if v != s
  end
  sum = sum > 0 && !@hash[u] ? sum + 2 : sum
  sum
end

# @param {Integer} n
# @param {Integer[][]} edges
# @param {Boolean[]} has_apple
# @return {Integer}
def min_time(n, edges, has_apple)
  @map, @hash = [], has_apple
  edges.each do |u, v|
    @map[u] ||= []
    @map[u] << v
    @map[v] ||= []
    @map[v] << u
  end
  sum = dfs(0, nil)
  sum > 0 ? sum - 2 : sum
end

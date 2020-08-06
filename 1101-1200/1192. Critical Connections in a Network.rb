def dfs(u, depth)
  return @rank[u] if @rank[u] && @rank[u] >= 0
  @rank[u] = depth
  min = @n
  @map[u].each do |v|
    next if @rank[v] == depth - 1
    back_depth = dfs(v, depth + 1)
    if back_depth <= depth
      @hash[u]&.delete(v)
      @hash[v]&.delete(u)
    end
    min = back_depth if back_depth < min
  end
  min
end

# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer[][]}
def critical_connections(n, connections)
  @n, @hash = n, {}
  connections.each do |u, v|
    @hash[u] ||= {}
    @hash[u][v] = true
  end
  @map = {}
  connections.each do |u, v|
    @map[u] ||= []
    @map[u] << v
    @map[v] ||= []
    @map[v] << u
  end

  @rank = {}
  dfs(0, 0)

  @ans = []
  @hash.each { |u, vs| vs.each { |v, _| @ans << [u, v] }  }
  @ans
end

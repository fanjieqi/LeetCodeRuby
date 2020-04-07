def dfs(i)
  return true if i == @graph.size
  l = @graph[i].find { |j| @left[j] }
  r = @graph[i].find { |j| @right[j] }
  return false if @left[i] && l || @right[i] && r || l && r
  if @left[i] || r
    @graph[i].each { |j| @right[j] = true }
    dfs(i+1)
  elsif @right[i] || l
    @graph[i].each { |j| @left[j] = true }
    dfs(i+1)
  else
    @left[i] = true
    @graph[i].each { |j| @right[j] = true }
    return true if dfs(i+1)
    @left.delete(i)
    @graph[i].each { |j| @right.delete(j) }

    return false if @graph[i].empty?
    @right[i] = true
    @graph[i].each { |j| @left[j] = true }
    return true if dfs(i+1)
    @right.delete(i)
    @graph[i].each { |j| @left.delete(j) }
    false
  end
end

# @param {Integer[][]} graph
# @return {Boolean}
def is_bipartite(graph)
  @graph, @left, @right = graph, {}, {}
  dfs(0)
end

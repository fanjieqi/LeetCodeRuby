def dfs(u)
  return unless @graph[u].empty?
  @reverse[u].to_a.each do |v|
    dfs(v) if @graph[v].delete(u)
  end
end

# @param {Integer[][]} graph
# @return {Integer[]}
def eventual_safe_nodes(graph)
  @graph, @reverse= graph, []
  @graph.each_with_index do |nodes, i|
    nodes.each do |u|
      @reverse[u] ||= []
      @reverse[u] << i
    end
  end
  (0..graph.size-1).each { |i| dfs(i) }
  (0..graph.size-1).select { |i| graph[i].empty? }
end

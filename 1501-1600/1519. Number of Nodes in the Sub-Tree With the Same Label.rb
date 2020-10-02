def dfs(u)
  @ans[u] ||= { @labels[u] => 1 }
  @mark[u] = true
  @map[u]&.each do |v|
    next if @mark[v]
    dfs(v)
    @ans[v]&.each do |label, count|
      @ans[u][label] = @ans[u][label].to_i + count
    end
  end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @param {String} labels
# @return {Integer[]}
def count_sub_trees(n, edges, labels)
  @map = []
  edges.each do |u, v|
    @map[u] ||= []
    @map[u] << v
    @map[v] ||= []
    @map[v] << u
  end
  @ans, @mark, @labels = {}, {}, labels
  dfs(0)
  (0..n-1).map { |u| @ans.dig(u, labels[u]) || 0 }
end

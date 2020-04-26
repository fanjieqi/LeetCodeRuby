def build_dist(graph)
  dist = []
  graph.each_with_index do |nodes, u|
    dist[u] ||= []
    nodes.each { |v| dist[u][v] = 1 }
  end
  (0..graph.size-1).each do |k|
    (0..graph.size-1).each do |i|
      (0..graph.size-1).each do |j|
        next if dist[i][k].nil? || dist[k][j].nil?
        if dist[i][j].nil? || dist[i][k] + dist[k][j] < dist[i][j]
          dist[i][j] = dist[i][k] + dist[k][j]
        end
      end
    end
  end
  dist
end

def dfs(u, sum = 0)
  if @mark.all?(&:positive?)
    @min = sum if sum < @min
    return
  end
  @array.each do |v|
    next if @mark[v].positive?
    tmp = sum+@dist[u][v]
    next if tmp > @min

    key = u.to_s + "_" + @mark.join
    if @hash[key].nil? || tmp < @hash[key]
      @hash[key] = tmp
      @mark[v] = 1
      dfs(v, tmp)
      @mark[v] = 0
    end
  end
end

# @param {Integer[][]} graph
# @return {Integer}
def shortest_path_length(graph)
  @n = graph.size
  @dist = build_dist(graph)
  indgree = []
  graph.each { |nodes| nodes.each { |v| indgree[v] ||= 0; indgree[v] += 1 } }
  @array = (0..@n-1).sort_by { |v| indgree[v] }

  @hash = {}
  @min = 1 << 31
  @mark = (0..@n-1).map{0}
  @array.each do |u, count|
    @mark[u] = 1
    dfs(u)
    @mark[u] = 0
  end
  @min
end

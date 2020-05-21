# @param {Integer[][]} edges
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def reachable_nodes(edges, m, n)
  map, hash = [], []
  edges.each do |i, j, k|
    hash[i] ||= {}
    hash[i][j] = 0
    map[i] ||= {}
    map[i][j] = k

    hash[j] ||= {}
    hash[j][i] = 0
    map[j] ||= {}
    map[j][i] = k
  end
  queue = Queue.new
  queue << [0, m]
  mark = [true]
  max = []
  while !queue.empty?
    u, rest = queue.pop
    next if rest == 0
    map[u].each do |v, k|
      if k <= rest
        hash[u][v] = k
      elsif rest > hash[u][v]
        hash[u][v] = rest 
      end
      tmp = rest - k - 1
      if tmp >= 0
        mark[v] = true
        if max[v].nil? || tmp > max[v]
          max[v] = tmp
          queue << [v, tmp]
        end
      end
    end if map[u]
  end
  count = mark.compact.size
  sum = []
  (0..hash.size-1).each do |u|
    sum[u] ||= {}
    hash[u].each do |v, k|
      tmp = [hash[u][v] + hash[v][u], map[u][v]].min
      sum[u][v] = tmp if tmp > 0
    end if hash[u]
  end
  count + sum.map(&:values).flatten.sum / 2
end

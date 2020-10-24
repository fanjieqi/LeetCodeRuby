# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def count_subgraphs_for_each_diameter(n, edges)
  map = []
  edges.each do |u, v|
    map[u] ||= []
    map[u][v] = 1
    map[v] ||= []
    map[v][u] = 1
  end
  (1..n).each do |k|
    (1..n).each do |i|
      (1..n).each do |j|
        next if i == k || j == k || i == j ||  map.dig(i, k).nil? || map.dig(k, j).nil? || map.dig(i, j) && map[i][k] + map[k][j] > map[i][j]
        map[i] ||= []
        map[i][j] = map[i][k] + map[k][j]
      end
    end
  end

  count = [0] * n
  (2..n).each do |k|
    (1..n).to_a.combination(k).each do |nodes|
      edge_count = nodes.combination(2).inject(0) { |sum, (i, j)| sum + (map[i][j] == 1 ? 1 : 0) }
      max = nodes.combination(2).inject(0) { |max, (i, j)| max > map.dig(i, j).to_i ? max : map.dig(i, j).to_i }
      count[max] += 1 if edge_count == k - 1
    end
  end
  count[1..n]
end

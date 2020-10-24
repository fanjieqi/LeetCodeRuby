# @param {Integer} n
# @param {Integer[][]} roads
# @return {Integer}
def maximal_network_rank(n, roads)
  map, roads_h = [], {}
  roads.each do |u, v|
    k = roads_h.size
    roads_h[[u, v]] = k
    map[u] ||= {}
    map[u][k] = true
    map[v] ||= {}
    map[v][k] = true
  end
  ans = 0
  (0..n-2).each do |i|
    (i+1..n-1).each do |j|
      tmp = map[i].to_h.merge(map[j].to_h)
      ans = tmp.size if tmp.size > ans
    end
  end
  ans
end

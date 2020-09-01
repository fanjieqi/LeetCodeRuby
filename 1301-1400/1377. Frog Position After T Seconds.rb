# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} t
# @param {Integer} target
# @return {Float}
def frog_position(n, edges, t, target)
  map = []
  edges.each do |u, v|
    map[u] ||= {}
    map[u][v] = true
    map[v] ||= {}
    map[v][u] = true
  end
  queue = Queue.new
  probabilities = { 1 => 1.to_r }
  queue << [1, 0]
  while !queue.empty?
    u, second = queue.pop
    next if second == t
    second += 1
    map[u]&.each do |v, _|
      probabilities[v] = probabilities[u] / map[u].size
      map[v].delete(u)
      queue << [v, second]
    end
    probabilities[u] = 0.to_f if map[u] && !map[u].empty?
  end
  probabilities[target].to_f
end

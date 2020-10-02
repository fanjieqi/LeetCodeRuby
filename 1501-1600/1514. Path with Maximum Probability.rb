# @param {Integer} n
# @param {Integer[][]} edges
# @param {Float[]} succ_prob
# @param {Integer} start
# @param {Integer} end
# @return {Float}
def max_probability(n, edges, succ_prob, start_at, end_at)
  map = []
  edges.each_with_index do |(u,v), i|
    map[u] ||= {}
    map[u][v] = succ_prob[i]
    map[v] ||= {}
    map[v][u] = succ_prob[i]
  end
  probability = { start_at => 1, end_at => 0}
  queue = Queue.new
  queue << start_at
  while !queue.empty?
    u = queue.pop
    map[u]&.each do |v, prob|
      tmp = probability[u] * prob
      next if probability[v] && tmp <= probability[v]
      probability[v] = tmp
      queue << v
    end
  end
  probability[end_at]
end

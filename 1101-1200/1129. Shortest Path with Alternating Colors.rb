# @param {Integer} n
# @param {Integer[][]} red_edges
# @param {Integer[][]} blue_edges
# @return {Integer[]}
def shortest_alternating_paths(n, red_edges, blue_edges)
  map = [[], []]
  red_edges.each { |u, v| map[0][u] = map[0][u].to_a << v }
  blue_edges.each { |u, v| map[1][u] = map[1][u].to_a << v }

  dis = [[0], [0]]
  queue = Queue.new
  queue << [0, 0]
  queue << [0, 1]
  while !queue.empty?
    u, color = queue.pop
    next if map[1-color][u].nil?
    map[1-color][u].each do |v|
      tmp = dis[color][u] + 1
      next if dis[1-color][v] && tmp > dis[1-color][v]
      dis[1-color][v] = tmp
      queue << [v, 1-color]
    end
  end

  (0..n-1).map do |i| 
    if dis.dig(1, i).nil? && dis.dig(0, i).nil?
      -1
    elsif dis.dig(1, i).nil?
      dis.dig(0, i)
    elsif dis.dig(0, i).nil?
      dis.dig(1, i)
    else
      [dis.dig(1, i), dis.dig(0, i)].min
    end
  end
end

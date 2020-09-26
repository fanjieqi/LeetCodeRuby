# @param {Integer} n
# @param {Integer[][]} connections
# @return {Integer}
def min_reorder(n, connections)
  map = []
  connections.each do |u, v|
    map[u] ||= {}
    map[u][v] = 1
    map[v] ||= {}
    map[v][u] = 0
  end
  queue = Queue.new
  queue << 0
  mark = {0 => true}
  count = 0
  while !queue.empty?
    u = queue.pop
    map[u].each do |v, flag|
      next if mark[v]
      count += 1 if flag == 1
      queue << v
      mark[v] = true
    end
  end
  count
end

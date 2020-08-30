# @param {Integer} n
# @param {Integer} head_id
# @param {Integer[]} manager
# @param {Integer[]} inform_time
# @return {Integer}
def num_of_minutes(n, head_id, manager, inform_time)
  map = {}
  manager.each_with_index do |u, v|
    next if u == -1
    map[u] ||= {}
    map[u][v] = inform_time[u]
  end
  dis = []
  dis[head_id] = 0
  queue = Queue.new
  queue << head_id
  while !queue.empty?
    u = queue.pop
    map[u]&.each do |v, time|
      tmp = dis[u] + time
      next if dis[v] && tmp >= dis[v]
      dis[v] = tmp
      queue << v
    end
  end
  dis.max
end

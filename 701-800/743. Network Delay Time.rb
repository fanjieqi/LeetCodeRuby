MAX = 1<<31
# @param {Integer[][]} times
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def network_delay_time(times, n, k)
  dis = n.times.map { MAX }
  map = []
  times.each do |u, v, w|
    map[u-1] ||= {}
    map[u-1][v-1] ||= w
    map[u-1][v-1] = w if w < map[u-1][v-1]
  end
  queue = Queue.new
  dis[k-1] = 0
  queue << k-1
  while !queue.empty?
    u = queue.pop
    map[u].each do |v, w|
      tmp = dis[u] + w
      if tmp < dis[v]
        dis[v] = tmp
        queue << v
      end
    end if map[u]
  end
  dis.any? { |tmp| tmp == MAX } ? -1 : dis.max
end

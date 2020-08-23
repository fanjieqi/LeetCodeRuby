# @param {Integer[]} arr
# @return {Integer}
def min_jumps(arr)
  n = arr.size
  indexes = {}
  (0..n-1).each do |i|
    indexes[arr[i]] ||= []
    indexes[arr[i]] << i
  end
  dist = {}
  queue = Queue.new
  dist[0] = 0
  queue << 0
  while !queue.empty?
    u = queue.pop
    # p u
    tmp = dist[u] + 1
    if u > 0 && (dist[u-1].nil? || tmp < dist[u-1])
      queue << u - 1
      dist[u-1] = tmp
    end
    if u < n-1 && (dist[u+1].nil? || tmp < dist[u+1])
      queue << u + 1
      dist[u+1] = tmp
    end
    while !indexes[arr[u]].empty?
      i = indexes[arr[u]].shift
      next if dist[i] && tmp >= dist[i]
      queue << i
      dist[i] = tmp
    end
  end
  dist[n-1]
end

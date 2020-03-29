NEXT = [
  [-1, 0, 0, 0],
  [ 1, 0, 0, 0],
  [0, -1, 0, 0],
  [0,  1, 0, 0],
  [0, 0, -1, 0],
  [0, 0,  1, 0],
  [0, 0, 0, -1],
  [0, 0, 0,  1],
]

# @param {String[]} deadends
# @param {String} target
# @return {Integer}
def open_lock(deadends, target)
  hash = deadends.map { |deadend| [deadend, true] }.to_h
  dis = {}
  queue = Queue.new
  queue << [[0, 0, 0, 0], 0] unless hash['0000']
  while !queue.empty?
    nums, count = queue.pop
    next if dis[target] && count >= dis[target]
    NEXT.each do |delta|
      tmp = (0..3).map {|i| (nums[i] + delta[i]) % 10}
      str = tmp.join
      next if hash[str]
      if dis[str].nil? || count + 1 < dis[str]
        dis[str] = count + 1
        queue << [tmp, count + 1]
      end
    end
  end
  dis[target] || -1
end

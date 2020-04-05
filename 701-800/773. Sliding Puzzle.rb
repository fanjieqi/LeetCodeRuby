STEPS = {
  0 => [1, 3],
  1 => [0, 2, 4],
  2 => [1, 5],
  3 => [0, 4],
  4 => [1, 3, 5],
  5 => [2, 4]
}

# @param {Integer[][]} board
# @return {Integer}
def sliding_puzzle(board)
  board.flatten!
  hash = { board => 0 }
  queue = Queue.new
  queue << board
  target = [1,2,3,4,5,0]
  while !queue.empty?
    map = queue.pop
    next if hash[target] && hash[map] >= hash[target]
    i = map.index(0)
    STEPS[i].each do |j|
      tmp = map.clone
      tmp[i], tmp[j] = tmp[j], tmp[i]
      next if hash[tmp] && (hash[map] >= hash[tmp])
      queue << tmp
      hash[tmp] = hash[map] + 1
    end
  end
  hash[target] || -1
end

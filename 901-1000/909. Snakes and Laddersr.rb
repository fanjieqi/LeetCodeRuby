# @param {Integer[][]} board
# @return {Integer}
def snakes_and_ladders(board)
  n = board.length
  hash = {1 => 0}
  queue = Queue.new
  queue << 1
  while !queue.empty?
    x = queue.pop
    (x+1..x+6).each do |i|
      a, b = (i - 1) / n, (i - 1) % n
      tmp = board[~a][a.even? ? b : ~b]
      i = tmp if tmp > 0
      return hash[x] + 1 if i == n * n
      next if hash[i]
      hash[i] = hash[x] + 1
      queue << i
    end
  end
  -1
end

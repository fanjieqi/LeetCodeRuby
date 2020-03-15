AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def min_step(x, y, xx, yy)
  @visited = Array.new(@m) { [] }
  @visited[x][y] = true

  queue = [[0, x, y]]
  while !queue.empty?
    step, x1, y1 = queue.shift
    return step if x1 == xx && y1 == yy
    AROUND.each do |i, j|
      x2, y2 = x1+i, y1+j
      next if x2 < 0 || x2 >= @m || y2 < 0 || y2 >= @n || @visited[x2][y2] || @forest[x2][y2] == 0
      return step+1 if x2 == xx && y2 == yy
      queue << [step+1, x2, y2]
      @visited[x2][y2] = true
    end
  end

  -1
end

# @param {Integer[][]} forest
# @return {Integer}
def cut_off_tree(forest)
  @forest = forest
  @m, @n = @forest.size, @forest[0].size

  trees = []
  @forest.each_with_index do |row, i|
    row.each_with_index do |ele, j|
      trees << [ele, i, j] if ele > 1
    end
  end
  trees.sort!

  ans = min_step(0, 0, trees[0][1], trees[0][2])
  (trees.size-1).times do |k|
    step = min_step(trees[k][1], trees[k][2], trees[k+1][1], trees[k+1][2])
    return -1 if step == -1
    ans += step
  end

  ans
end

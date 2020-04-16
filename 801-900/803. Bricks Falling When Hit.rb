AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def init_bfs
  queue = Queue.new
  @grid[0].each_with_index do |ele, y|
    next if ele.zero?
    @grid[0][y] = 2
    queue << [0, y]
  end
  while !queue.empty?
    x, y = queue.pop
    AROUND.each do |i, j|
      x1, y1 = x+i, y+j
      next if x1 < 0 || x1 >= @m || y1 < 0 || y1 >= @n || @grid[x1][y1] != 1
      @grid[x1][y1] = 2
      queue << [x1, y1]
    end
  end
end

def bfs(point)
  mark = {point => true}
  queue = Queue.new
  queue << point
  flag = false
  while !queue.empty?
    x, y = queue.pop
    flag = true if @grid[x][y] == 2
    AROUND.each do |i, j|
      x1, y1 = x+i, y+j
      next if x1 < 0 || x1 >= @m || y1 < 0 || y1 >= @n || @grid[x1][y1] < 1 || mark[[x1, y1]] || flag && @grid[x1][y1] == 2
      mark[[x1, y1]] = true
      queue << [x1, y1]
    end
  end
  flag ? mark.select { |(x, y), v| @grid[x][y] == 1 } : {}
end

# @param {Integer[][]} grid
# @param {Integer[][]} hits
# @return {Integer[]}
def hit_bricks(grid, hits)
  @grid, @m, @n = grid, grid.size, grid[0].size
  original = []
  hits.each do |x, y|
    original[x] ||= []
    original[x][y] = @grid[x][y]
    @grid[x][y] = 0
  end
  init_bfs

  hits.reverse.map do |x, y|
    @grid[x][y] = original[x] && (original[x][y] > 0) ? (x.zero? ? 2 : 1) : 0
    if @grid[x][y].zero?
      0
    else
      result = bfs([x, y])
      result.each { |(x1, y1), v| @grid[x1][y1] = 2 }
      result.delete([x, y])
      result.size
    end
  end.reverse
end

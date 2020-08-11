AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def dfs(x, y)
  @grid[x][y] = @color
  AROUND.each do |dx, dy|
    xx, yy = x + dx, y + dy
    if xx < 0 || xx >= @n || yy < 0 || yy >= @m
      @flag = false
      next
    end
    dfs(xx, yy) if @grid[xx][yy] == 0
  end
end

# @param {Integer[][]} grid
# @return {Integer}
def closed_island(grid)
  @grid, @n, @m, @flag, @color, count = grid, grid.size, grid[0].size, true, 2, 0
  (0..@n-1).each do |x|
    (0..@m-1).each do |y|
      next if @grid[x][y] != 0
      @color += 1
      @flag = true
      dfs(x, y)
      count += 1 if @flag
    end
  end
  count
end

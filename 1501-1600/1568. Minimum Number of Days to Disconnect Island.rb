AROUND = [
  [0, 1],
  [0,-1],
  [1, 0],
  [-1,0],
]

def dfs(x, y)
  @mark[x] ||= []
  @mark[x][y] = true
  AROUND.each do |dx, dy|
    xx, yy = x + dx, y + dy
    next if xx < 0 || xx >= @n || yy < 0 || yy >= @m || @grid[xx][yy] == 0 || @mark.dig(xx, yy)
    dfs(xx, yy)
  end
end

def count_islands
  @mark, count = {}, 0
  (0..@n-1).each do |i|
    (0..@m-1).each do |j|
      next if @grid[i][j] == 0 || @mark.dig(i, j)
      count += 1
      dfs(i, j)
    end
  end
  count
end

# @param {Integer[][]} grid
# @return {Integer}
def min_days(grid)
  @grid, @n, @m, count = grid, grid.size, grid[0].size
  return 0 if count_islands() != 1
  (0..@n-1).each do |i|
    (0..@m-1).each do |j|
      next if @grid[i][j] == 0
      @grid[i][j] = 0
      return 1 if count_islands() != 1
      @grid[i][j] = 1
    end
  end
  2
end

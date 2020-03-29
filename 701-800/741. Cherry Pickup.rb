MIN = -(2 << 31)
# @param {Integer[][]} grid
# @return {Integer}
def cherry_pickup(grid)
  @f, @grid, @n = {}, grid, grid.size
  [dfs(0, 0, 0, 0), 0 ].max
end

def dfs(x1, y1, x2, y2)
  return @f[[x1, y1, x2, y2]] if @f[[x1, y1, x2, y2]]
  return @grid[-1][-1] if x1 == @n-1 && y1 == @n-1 && x2 == @n-1 && y2 == @n-1
  return MIN if x1 >= @n || x2 >= @n || y1 >= @n || y2 >= @n || @grid[x1][y1] == -1 || @grid[x2][y2] == -1

  max = [
    dfs(x1+1, y1, x2+1, y2),
    dfs(x1+1, y1, x2, y2+1),
    dfs(x1, y1+1, x2+1, y2),
    dfs(x1, y1+1, x2, y2+1)
  ].max
  max += [x1,y1] == [x2, y2] ? @grid[x1][y1] : @grid[x1][y1] + @grid[x2][y2]
  @f[[x1, y1, x2, y2]] = max
end

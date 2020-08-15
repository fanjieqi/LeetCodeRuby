AROUND = [
  [+1, 0],
  [0, +1],
  [0, -1],
  [-1, 0],
]

def dfs(x, y, k, l)
  return if k < 0
  return if @min && l >= @min
  @min = l if x == @n-1 && y == @m-1
  return if @min && (l + @n-1-x + @m-1-y >= @min)

  @hash[x] ||= {}
  @hash[x][y] ||= {}
  return if @hash[x][y][k] && l >= @hash[x][y][k]
  @hash[x][y][k] = l

  AROUND.each do |dx, dy|
    xx, yy = x + dx, y + dy
    next if xx < 0 || xx >= @n || yy < 0 || yy >= @m
    dfs(xx, yy, k - @grid[xx][yy], l+1) if k - @grid[xx][yy] >= 0
  end
end

# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer}
def shortest_path(grid, k)
  @n, @m, @grid, @hash, @min = grid.size, grid[0].size, grid, {}, nil
  dfs(0, 0, [k, @n+@m-1].min, 0)
  @min || -1
end

AROUND = [
  [ 1,  0],
  [ 0,  1],
  [-1,  0],
  [ 0, -1],
]

def dfs(x, y, depth)
  return if depth >= @depth[-1][-1]
  @depth[x][y] = depth
  AROUND.each do |i, j|
    x1, y1 = x+i, y+j
    next if x1 < 0 || x1 >= @m || y1 < 0 || y1 >= @n
    tmp = [depth, @grid[x1][y1]].max
    next if tmp >= @depth[x1][y1]
    dfs(x1, y1, tmp)
  end
end

# @param {Integer[][]} grid
# @return {Integer}
def swim_in_water(grid)
  @grid, @m, @n = grid, grid.size, grid[0].size
  max = grid.map(&:max).max
  @depth = @m.times.map { @n.times.map {max} }
  dfs(0, 0, @grid[0][0])
  @depth[-1][-1]
end

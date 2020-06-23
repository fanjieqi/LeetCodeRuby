AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

def dfs(x, y, rest)
  rest -= 1
  AROUND.each do |dx, dy|
    xx = x + dx
    yy = y + dy
    next if xx < 0 || xx >= @m || yy < 0 || yy >= @n || @grid[xx][yy] == -1 || @grid[xx][yy] == 1
    if @grid[xx][yy] == 2
      @count += 1 if rest.zero?
    else
      @grid[xx][yy] = -1
      dfs(xx, yy, rest)
      @grid[xx][yy] = 0
    end
  end
end

# @param {Integer[][]} grid
# @return {Integer}
def unique_paths_iii(grid)
  @grid = grid
  @m, @n, @count = @grid.size, @grid[0].size, 0

  rest = 1
  (0..@m-1).each do |i|
    (0..@n-1).each do |j|
      if @grid[i][j] == 1
        @x, @y = i, j
      elsif @grid[i][j] == 0
        rest += 1
      end
    end
  end

  dfs(@x, @y, rest)
  @count
end

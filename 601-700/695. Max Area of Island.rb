AROUND = [
  [ 1,  0],
  [ 0,  1],
  [-1,  0],
  [ 0, -1],
]

def dfs(x, y, num)
  @grid[x][y] = num
  AROUND.each do |i, j|
    x1, y1 = x+i, y+j
    next if x1<0 || x1>=@m || y1<0 || y1>=@n || @grid[x1][y1] == 0
    dfs(x1, y1, num) if @grid[x1][y1] == 1
  end
end

# @param {Integer[][]} grid
# @return {Integer}
def max_area_of_island(grid)
  @grid = grid
  @m = @grid.size
  @n = @grid[0].size
  num = 1
  @grid.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      dfs(x, y, num+=1) if ele == 1
    end
  end
  @grid.flatten.reject(&:zero?).group_by(&:itself).transform_values(&:count).values.max.to_i
end

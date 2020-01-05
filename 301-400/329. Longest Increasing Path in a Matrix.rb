AROUND = [
  [0, 1],
  [0,-1],
  [1, 0],
  [-1,0],
]
def dfs(x, y)
  return @deepth[x][y] if @deepth[x] && @deepth[x][y]
  max = 1
  AROUND.each do |i, j|
    xx, yy = x + i, y + j
    next if xx < 0 || xx > @m - 1 || yy < 0 || yy > @n - 1 || @matrix[xx][yy] <= @matrix[x][y] || @mark[xx] && @mark[xx][yy]
    @mark[xx] ||= []
    @mark[xx][yy] = true
    max = [max, 1 + dfs(xx, yy)].max
    @mark[xx][yy] = false
  end
  @deepth[x] ||= []
  @deepth[x][y] = max
  @max = [@max, @deepth[x][y]].max
  max
end

# @param {Integer[][]} matrix
# @return {Integer}
def longest_increasing_path(matrix)
  return 0 if matrix.length == 0
  @matrix = matrix
  @m = @matrix.length
  @n = @matrix[0].length
  @max = 0

  @mark = []
  @deepth = []
  @matrix.each_with_index do |row, x|
    @mark[x] ||= []
    @deepth[x] ||= []
    row.each_with_index do |ele, y|
      next if AROUND.any? {|i, j| x + i >= 0 && x + i <= @m - 1 && y + j >= 0 && y + j <= @n - 1 && @matrix[x+i][y+j] < ele}
      @mark[x][y] = true
      dfs(x, y)
      @mark[x][y] = false
    end
  end
  @max
end

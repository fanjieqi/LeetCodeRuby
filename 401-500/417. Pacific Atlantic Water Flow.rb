AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

def dfs(x, y, visited)
  visited[x] ||= []
  visited[x][y] = true
  AROUND.each do |i, j|
    xx, yy = x + i, y + j
    visited[xx] ||= []
    next if xx < 0 || xx >= @m || yy < 0 || yy >= @n || visited[xx][yy] || @matrix[xx][yy] < @matrix[x][y]
    dfs(xx, yy, visited)
  end
end

# @param {Integer[][]} matrix
# @return {Integer[][]}
def pacific_atlantic(matrix)
  return [] if matrix.length == 0

  @matrix = matrix
  @m = @matrix.length
  @n = @matrix[0].length

  p_visited = []
  a_visited = []
  (0..@m-1).each do |i|
    dfs(i, 0, p_visited)
    dfs(i, @n-1, a_visited)
  end
  (0..@n-1).each do |j|
    dfs(0, j, p_visited)
    dfs(@m-1, j, a_visited)
  end

  result = []
  (0..@m-1).each do |i|
    (0..@n-1).each do |j|
      result << [i,j] if p_visited[i][j] && a_visited[i][j]
    end
  end

  result
end

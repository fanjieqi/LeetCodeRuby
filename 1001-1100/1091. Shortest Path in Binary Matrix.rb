AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
  [1,  1],
  [1, -1],
  [-1, 1],
  [-1,-1],
]

# @param {Integer[][]} grid
# @return {Integer}
def shortest_path_binary_matrix(grid)
  return -1 if grid[0][0] == 1 || grid[-1][-1] == 1
  n, m = grid.size, grid[0].size
  mark = [{}]
  queue = Queue.new
  mark[0][0] = 1
  queue << [0, 0, 1] 
  while !queue.empty?
    x, y, dis = queue.pop
    return dis if x== n-1 && y ==m-1
    AROUND.each do |dx, dy|
      xx, yy = x + dx, y + dy
      tmp = dis + 1
      next if xx < 0 || xx >= n || yy < 0 || yy >= m || grid[xx][yy] == 1 || mark.dig(xx, yy) && tmp >= mark.dig(xx, yy)
      mark[xx] ||= {}
      mark[xx][yy] = tmp
      queue << [xx, yy, tmp]
    end
  end
  mark.dig(n-1, m-1) || -1
end

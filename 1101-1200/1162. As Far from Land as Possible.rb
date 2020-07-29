AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Integer[][]} grid
# @return {Integer}
def max_distance(grid)
  queue = Queue.new
  n, m = grid.size, grid[0].size
  dist = []
  (0..n-1).each do |i|
    dist[i] = []
    (0..m-1).each do |j|
      next if grid[i][j] == 0
      queue << [i, j] 
      dist[i][j] = 0
    end
  end

  while !queue.empty?
    x, y = queue.pop
    tmp = dist[x][y] + 1
    AROUND.each do |dx, dy|
      xx, yy = x + dx, y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= m || grid[xx][yy] == 1 || dist.dig(xx, yy)
      queue << [xx, yy]
      dist[xx] ||= []
      dist[xx][yy] = tmp
      queue << [xx, yy]
    end
  end

  max = dist.flatten.max 
  max.nil? || max.zero? ? -1 : max
end

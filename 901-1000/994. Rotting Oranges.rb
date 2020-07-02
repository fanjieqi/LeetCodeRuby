AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Integer[][]} grid
# @return {Integer}
def oranges_rotting(grid)
  queue = Queue.new
  n, m = grid.size, grid[0].size

  (0..n-1).each do |i|
    (0..m-1).each do |j|
      queue << [i, j, 0] if grid[i][j] == 2
    end
  end

  count = 0
  while !queue.empty?
    x, y, second = queue.pop
    count = second
    second += 1
    AROUND.each do |dx, dy|
      xx = x + dx
      yy = y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= m || grid[xx][yy] != 1
      grid[xx][yy] = 2
      queue << [xx, yy, second]
    end
  end

  grid.any? { |row| row.include?(1) } ? -1 : count
end

AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Integer[][]} a
# @return {Integer}
def num_enclaves(a)
  queue = Queue.new
  n, m = a.size, a[0].size

  (0..n-1).each do |i|
    queue << [i, 0] if a[i][0] == 1
    queue << [i, m-1] if a[i][m-1] == 1
  end
  (0..m-1).each do |j|
    queue << [0, j] if a[0][j] == 1
    queue << [n-1, j] if a[n-1][j] == 1
  end

  count = 0
  while !queue.empty?
    x, y = queue.pop
    a[x][y] = 0
    AROUND.each do |dx, dy|
      xx = x + dx
      yy = y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= m || a[xx][yy] != 1
      a[xx][yy] = 0
      queue << [xx, yy]
    end
  end

  a.map(&:sum).sum
end

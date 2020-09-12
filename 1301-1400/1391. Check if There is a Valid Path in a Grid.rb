AROUNDS = {
  1 => {[0, -1] => [1, 4, 6], [0,  1] => [1, 3, 5]},
  2 => {[-1, 0] => [2, 3, 4], [1,  0] => [2, 5, 6]},
  3 => {[0, -1] => [1, 4, 6], [1,  0] => [2, 5, 6]},
  4 => {[0,  1] => [1, 3, 5], [1,  0] => [2, 5, 6]},
  5 => {[0, -1] => [1, 4, 6], [-1, 0] => [2, 3, 4]},
  6 => {[0,  1] => [1, 3, 5], [-1, 0] => [2, 3, 4]},
}

# @param {Integer[][]} grid
# @return {Boolean}
def has_valid_path(grid)
  n, m = grid.size, grid[0].size
  queue = Queue.new
  hash = { 0 => { 0 => true} }
  queue << [0, 0]
  while !queue.empty?
    x, y = queue.pop
    AROUNDS[grid[x][y]].each do |(dx, dy), vs|
      xx, yy = x + dx, y + dy
      next if xx < 0 || xx >= n || yy < 0 || yy >= m || hash.dig(xx, yy) || !vs.include?(grid[xx][yy])
      return true if xx == n-1 && yy == m-1
      hash[xx] ||= {}
      hash[xx][yy] = true
      queue << [xx, yy]
    end
  end
  !!hash.dig(n-1, m-1)
end

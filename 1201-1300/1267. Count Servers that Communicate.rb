# @param {Integer[][]} grid
# @return {Integer}
def count_servers(grid)
  n, m = grid.size, grid[0].size
  row, col = {}, {}
  (0..n-1).each { |i| row[i] = grid[i].sum }
  (0..m-1).each { |j| col[j] = (0..n-1).inject(0) { |sum, i| sum += grid[i][j] } }

  count = 0
  (0..n-1).each do |i|
    (0..m-1).each do |j|
      count += 1 if grid[i][j] == 1 && (row[i].to_i >= 2 || col[j].to_i >= 2)
    end
  end
  count
end

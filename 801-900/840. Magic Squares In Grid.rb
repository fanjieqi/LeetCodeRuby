# @param {Integer[][]} grid
# @return {Integer}
def num_magic_squares_inside(grid)
  sum = 0
  (0..grid.size-3).each do |i|
    (0..grid[0].size-3).each do |j|
      next if (grid[i][j,3] + grid[i+1][j,3] + grid[i+2][j,3]).uniq.sort != (1..9).to_a
      r1, r2 = grid[i][j,3].sum, grid[i+1][j,3].sum
      next if r1 != r2
      r3 = grid[i+2][j,3].sum
      next if r1 != r3
      c1 = grid[i][j] + grid[i+1][j] + grid[i+2][j]
      c2 = grid[i][j+1] + grid[i+1][j+1] + grid[i+2][j+1]
      next if c1 != c2
      c3 = grid[i][j+2] + grid[i+1][j+2] + grid[i+2][j+2]
      next if c1 != c3

      d1 = grid[i][j] + grid[i+1][j+1] + grid[i+2][j+2]
      d2 = grid[i][j+2] + grid[i+1][j+1] + grid[i+2][j]
      next if d1 != d2
      sum += 1
    end
  end
  sum
end

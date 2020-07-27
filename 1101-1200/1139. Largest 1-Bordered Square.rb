# @param {Integer[][]} grid
# @return {Integer}
def largest1_bordered_square(grid)
  m, n = grid.size, grid[0].size
  top, left = grid.map(&:clone), grid.map(&:clone)
  (0..m-1).each do |i|
    (0..n-1).each do |j|
      next if grid[i][j] == 0
      top[i][j] = top[i-1][j]+1 if i > 0
      left[i][j] = left[i][j-1]+1 if j > 0
    end
  end

  [m, n].min.downto(0) do |r|
    (0..m-r).each do |i|
      (0..n-r).each do |j|
        return r * r if [top[i+r-1][j], top[i+r-1][j+r-1], left[i][j+r-1], left[i+r-1][j+r-1]].min >= r
      end
    end
  end
  0
end

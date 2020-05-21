# @param {Integer[][]} grid
# @return {Integer}
def projection_area(grid)
  x, y, z = [], [], []
  grid.each_with_index do |row, i|
    z[i] ||= []
    x[i] ||= 0
    row.each_with_index do |v, j|
      z[i][j] = 1 if v > 0
      x[i] = v if v > x[i]
      y[j] ||= 0
      y[j] = v if v > y[j]
    end
  end
  z.flatten.compact.sum + x.compact.sum + y.compact.sum
end

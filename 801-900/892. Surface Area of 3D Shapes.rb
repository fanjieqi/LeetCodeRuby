AROUND = [
  [+1, 0],
  [0, -1],
  [0, +1],
  [-1, 0],
]

# @param {Integer[][]} grid
# @return {Integer}
def surface_area(grid)
  sum = 0
  grid.each_with_index do |row, i|
    row.each_with_index do |v, j|
      next if v.zero?
      sum += 2
      AROUND.each do |dx, dy|
        x, y = i + dx, j + dy
        if x == -1 || y == -1 || x == grid.size || y == row.size
          sum += v
        elsif grid[x][y] < v
          sum += v - grid[x][y]
        end
      end
    end
  end
  sum
end

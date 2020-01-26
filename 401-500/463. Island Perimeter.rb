AROUND = [
  [0, -1],
  [0, +1],
  [-1, 0],
  [+1, 0],
]

# @param {Integer[][]} grid
# @return {Integer}
def island_perimeter(grid)
  ans = 0
  m, n = grid.length, grid[0].length
  grid.each_with_index do |row, x|
    row.each_with_index do |ele, y|
      next if ele == 0
      ans += 4
      AROUND.each do |i, j|
        xx, yy = x + i, y + j
        next if xx < 0 || xx >= m || yy < 0 || yy >= n
        ans -= 1 if grid[xx][yy] == 1
      end
    end
  end
  ans
end

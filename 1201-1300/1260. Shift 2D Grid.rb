# @param {Integer[][]} grid
# @param {Integer} k
# @return {Integer[][]}
def shift_grid(grid, k)
  n = grid.size
  k.times do
    (0..n-1).each do |i|
      grid[(i+1) % n].unshift(grid[i].pop)
    end
  end
  grid
end

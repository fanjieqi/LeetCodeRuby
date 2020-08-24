# @param {Integer[][]} grid
# @return {Integer}
def count_negatives(grid)
  grid.flatten.select(&:negative?).count
end

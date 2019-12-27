# @param {Integer[][]} grid
# @return {Integer}
def min_path_sum(grid)
  m = grid.length
  n = grid[0].length
  ans = [[]]
  (1..m).each do |i|
    (1..n).each do |j|
      ans[i] ||= []
      ans[i][j] = grid[i-1][j-1]
      next if i == 1 && j == 1
      if i == 1
        ans[i][j] += ans[i][j-1]
      elsif j == 1
        ans[i][j] += ans[i-1][j]
      else
        ans[i][j] += [ans[i-1][j].to_i, ans[i][j-1].to_i].min
      end
    end
  end
  ans[m][n]
end

p min_path_sum([
  [1,3,1],
  [1,5,1],
  [4,2,1]
])
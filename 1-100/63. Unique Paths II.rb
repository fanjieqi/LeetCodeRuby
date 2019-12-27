# @param {Integer[][]} obstacle_grid
# @return {Integer}
def unique_paths_with_obstacles(obstacle_grid)
  m = obstacle_grid.length
  n = obstacle_grid[0].length
  ans = [[], [0, 1- obstacle_grid[0][0]]]
  (1..m).each do |i|
    (1..n).each do |j|
      ans[i] ||= []
      if obstacle_grid[i-1][j-1] == 1
        ans[i][j] ||= 0
      elsif i >= 1 && j >= 1
        ans[i][j] ||= ans[i-1][j].to_i + ans[i][j-1].to_i
      elsif i >= 1
        ans[i][j] ||= ans[i-1][j].to_i
      elsif j >= 1
        ans[i][j] ||= ans[i][j-1].to_i
      end
    end
  end
  ans[m][n]
end

# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def unique_paths(m, n)
  ans = [[],[0,1]]
  (1..m).each do |i|
    (1..n).each do |j|
      ans[i] ||= []
      if i >= 1 && j >= 1
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

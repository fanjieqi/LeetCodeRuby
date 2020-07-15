MAX = 1 << 31
# @param {Integer[]} a
# @return {Integer}
def min_score_triangulation(a)
  n, dp = a.size, []
  (n-1).downto(0) do |i|
    dp[i] = []
    (i+1..n-1).each do |j|
      (i+1..j-1).each do |k|
        dp[i][j] = [dp[i][j].to_i == 0 ? MAX : dp[i][j].to_i, dp[i][k].to_i + a[i] * a[k] * a[j] + dp[k][j].to_i].min
      end
    end
  end
  dp[0][- 1]
end

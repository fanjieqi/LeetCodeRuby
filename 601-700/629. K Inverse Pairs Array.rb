MOD = 10**9 + 7

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def k_inverse_pairs(n, k)
  return 0 if (k > n*(n-1)/2 || k < 0)
  return 1 if (k == 0 || k == n*(n-1)/2)
  f = []
  f[2] = [1, 1]
  (3..n).each do |i|
    f[i] = [1]
    (1..[k, i*(i-1)/2].min).each do |j|
      f[i][j] = f[i][j-1].to_i + f[i-1][j].to_i
      f[i][j] -= f[i-1][j-i].to_i if (j >= i) 
      f[i][j] %= MOD
    end
  end
  f[n][k]
end

MOD = 10**9 + 7
# @param {Integer} n
# @param {Integer} l
# @param {Integer} k
# @return {Integer}
def num_music_playlists(n, l, k)
  f, fac = [], [1]
  (1..n).each { |i| fac[i] = fac[i-1] * i % MOD }
  (k+1..n).each do |i|
    f[i] ||= []
    (i..l).each do |j|
      if i == j || i == k + 1
        f[i][j] = fac[i]
      else
        f[i][j] = f[i - 1][j - 1] * i + f[i][j - 1] * (i - k)
      end
      f[i][j] %= MOD
    end
  end
  f[n][l] % MOD
end

TMP = 10**9 + 7
# @param {Integer} n
# @return {Integer}
def num_tilings(n)
  f = [0, 1, 2, 5]
  (4..n).each { |i| f[i] = (f[i-1]*2 + f[i-3]) % TMP }
  f[n]
end

MOD = 10**9 + 7

# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def number_of_sets(n, k)
  (1..(n+k-1)).to_a.combination(2*k).size % MOD
end

MOD = 10**9 + 7
# @param {Integer} n
# @return {Integer}
def count_orders(n)
  (2..n).inject(1) { |ans, i| ans * (2 * i * i - i) % MOD }
end

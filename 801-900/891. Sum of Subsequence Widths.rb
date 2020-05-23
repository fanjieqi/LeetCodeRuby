MOD = 10**9 + 7
# @param {Integer[]} a
# @return {Integer}
def sum_subseq_widths(a)
  a.sort!
  sum, n = 0, a.size
  (0..n-1).each do |i|
    sum += ((a[i] << i) - (a[n-i-1] << i)) % MOD
  end
  sum % MOD
end

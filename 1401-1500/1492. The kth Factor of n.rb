# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_factor(n, k)
  (1..n).select { |i| n % i == 0 }[k-1] || -1
end

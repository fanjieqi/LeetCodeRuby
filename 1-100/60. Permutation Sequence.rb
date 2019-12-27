# @param {Integer} n
# @param {Integer} k
# @return {String}
def get_permutation(n, k)
  (1..n).map(&:to_s).permutation.to_a[k-1].join("")
end

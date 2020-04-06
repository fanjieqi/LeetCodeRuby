# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def kth_grammar(n, k)
  return 0 if n == 1
  mid = 1 << (n-2)
  k <= mid ? kth_grammar(n-1, k) : 1 - kth_grammar(n-1, k-mid)
end

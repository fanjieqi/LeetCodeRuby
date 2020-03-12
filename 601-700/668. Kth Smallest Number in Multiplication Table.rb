# @param {Integer} m
# @param {Integer} n
# @param {Integer} k
# @return {Integer}
def find_kth_number(m, n, k)
  (1..m*n).bsearch { |x| (1..m).map { |i| [x / i, n].min }.sum >= k }
end

# @param {Integer} n
# @return {Integer}
def min_operations(n)
  (1..n/2).inject(0) { |sum, i| sum += (n - 2*i + 1 ) }
end

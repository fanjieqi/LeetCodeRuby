# @param {Integer} n
# @param {Integer} start
# @return {Integer}
def xor_operation(n, start)
  (1..n-1).inject(start) { |tmp, i| tmp ^ (start +2 * i) }
end

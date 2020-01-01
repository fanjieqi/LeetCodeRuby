BYTES = (0..30).map { |i| 1 << i }.reverse
# @param {Integer} m
# @param {Integer} n
# @return {Integer}
def range_bitwise_and(m, n)
  return 0 if m == 0
  start = BYTES.find {|i| m <= i && i <= n}
  start ? start & m & n : (m..n).inject(m) {|ans, i| ans &= i }
end

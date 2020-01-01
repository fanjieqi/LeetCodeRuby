# @param {Integer} n, a positive integer
# @return {Integer}
def reverse_bits(n)
  sprintf("%.32b", n).reverse.to_i(2)
end

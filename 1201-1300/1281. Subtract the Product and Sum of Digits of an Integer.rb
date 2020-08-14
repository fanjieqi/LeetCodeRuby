# @param {Integer} n
# @return {Integer}
def subtract_product_and_sum(n)
  arr = n.to_s.chars.map(&:to_i)
  arr.inject(&:*) - arr.sum
end

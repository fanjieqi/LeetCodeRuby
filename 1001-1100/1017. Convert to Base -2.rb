# @param {Integer} n
# @return {String}
def base_neg2(n)
  return n.to_s if n == 0 || n == 1
  base_neg2(-(n >> 1)) + (n & 1).to_s
end

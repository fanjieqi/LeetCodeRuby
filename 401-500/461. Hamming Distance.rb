# @param {Integer} x
# @param {Integer} y
# @return {Integer}
def hamming_distance(x, y)
  (x ^ y).to_s(2).scan("1").count
end

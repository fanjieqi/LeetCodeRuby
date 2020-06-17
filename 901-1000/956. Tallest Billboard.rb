# @param {Integer[]} rods
# @return {Integer}
def tallest_billboard(rods)
  hash = {0 => 0}
  rods.each do |x|
    i = 0
    hash.clone.each do |d, y|
      hash[d + x] = [hash[d + x] || 0, y].max
      hash[(d - x).abs] = [hash[(d - x).abs] || 0, y + [d, x].min].max
    end
  end
  hash[0]
end

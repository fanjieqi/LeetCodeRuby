# @param {Integer} area
# @return {Integer[]}
def construct_rectangle(area)
  k = Math.sqrt(area).to_i
  while k > 0
    return [area/k, k] if area % k == 0
    k -= 1
  end
end

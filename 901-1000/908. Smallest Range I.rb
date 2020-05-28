# @param {Integer[]} a
# @param {Integer} k
# @return {Integer}
def smallest_range_i(a, k)
  max, min = a.max - k, a.min + k
  max <= min ? 0 : max - min
end

# @param {Integer[]} a
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def num_subarray_bounded_max(a, l, r)
  res, dp, prev = 0, 0, -1
  a.each_with_index do |num, i|
    res += dp if num < l && i > 0
    if num > r
      dp = 0
      prev = i
    end
    if l <= num && num <= r
      dp = i - prev
      res += dp
    end
  end
  res
end

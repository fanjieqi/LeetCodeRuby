# @param {Integer[]} nums
# @param {Integer} threshold
# @return {Integer}
def smallest_divisor(nums, threshold)
  nums.sort!
  l, r = 1, nums[-1]
  while l < r
    mid = (l + r) / 2
    tmp = nums.map  { |num| (num / mid.to_f).ceil }.sum
    if tmp <= threshold
      r = mid
    else
      l = mid + 1
    end
  end
  l
end

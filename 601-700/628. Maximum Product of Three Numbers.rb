# @param {Integer[]} nums
# @return {Integer}
def maximum_product(nums)
  return nums.inject(&:*) if nums.size == 3
  nums.sort!
  [
    nums[0] * nums[1] * nums[-1],
    nums.select(&:negative?).max.to_i * nums[-2] * nums[-1],
    nums[-3] * nums[-2] * nums[-1],
  ]
end

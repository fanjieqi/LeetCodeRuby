# @param {Integer[]} nums
# @return {Integer[]}
def find_error_nums(nums)
  uniq_sum = nums.uniq.sum
  [nums.sum - uniq_sum, (1..nums.size).sum - uniq_sum]
end

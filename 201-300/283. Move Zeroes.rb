# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def move_zeroes(nums)
  tmp = nums.reject(&:zero?) + nums.select(&:zero?)
  (0..nums.length-1).each {|i| nums[i] = tmp[i]}
end

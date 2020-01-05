# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
  return nums if nums.length <= 1
  tmp = nums.sort

  i = -1
  (nums.length/2).times { nums[i+=2] = tmp.pop }

  i = -2
  nums[i+=2] = tmp.pop while !tmp.empty?
  nums
end

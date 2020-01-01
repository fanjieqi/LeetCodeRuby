# @param {Integer[]} nums
# @param {Integer} k
# @return {Void} Do not return anything, modify nums in-place instead.
def rotate(nums, k)
  return nums if k == 0
  k.times { nums = nums.unshift(nums.pop)}
end

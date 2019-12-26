# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def next_permutation(nums)
  r = nums.length - 2
  r -= 1 while r >= 0 && nums[r+1] <= nums[r]

  if r >= 0
    l = nums.length - 1;
    l -=1 while l >= 0 && nums[l] <= nums[r]
    nums[l], nums[r] = nums[r], nums[l]
  end

  rest = nums[r+1..-1].reverse
  rest.each_with_index do |ele, i|
    nums[r+i+1] = rest[i]
  end
  nums
end

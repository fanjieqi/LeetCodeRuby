# @param {Integer} n
# @return {Integer}
def nth_ugly_number(n)
  nums = [1]
  i, i2, i3, i5 = 0, 0, 0, 0
  while i < n - 1
    min = [nums[i2] * 2, nums[i3] * 3, nums[i5] * 5].min
    nums[i+=1] = min
    i2 += 1 while (nums[i2] * 2 <= nums[i])
    i3 += 1 while (nums[i3] * 3 <= nums[i])
    i5 += 1 while (nums[i5] * 5 <= nums[i])
  end
  nums[n-1]
end

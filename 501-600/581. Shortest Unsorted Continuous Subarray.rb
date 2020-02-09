# @param {Integer[]} nums
# @return {Integer}
def find_unsorted_subarray(nums)
  arr = nums.sort
  i = 0
  i += 1 while nums[i] == arr[i] && i < nums.length
  j = nums.length-1
  j -= 1 while nums[j] == arr[j] && j > i
  j - i + 1
end

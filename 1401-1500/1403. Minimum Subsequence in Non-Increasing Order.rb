# @param {Integer[]} nums
# @return {Integer[]}
def min_subsequence(nums)
  nums.sort!
  n, sum = nums.size, [0]
  nums.each_with_index { |num, i| sum[i+1] = sum[i] + num }
  i = n
  i -= 1 while sum[i] >= sum[n] - sum[i]
  nums[i..n-1].reverse
end

# @param {Integer[]} nums
# @param {Integer} k
# @return {Integer}
def smallest_distance_pair(nums, k)
  nums.sort!
  n = nums.length
  l, r = 0, nums[-1] - nums[0]
  while l < r
    count, j, mid = 0, 0, (l + r)/2
    nums.each_with_index do |num, i|
      j += 1 while (nums[j] && nums[j] - num <= mid)
      count += (j - i - 1)
    end
    if count >= k
      r = mid
    else
      l = mid + 1
    end
  end
  l
end

def is_valid(nums, m, mid)
  count, sum = 0, 0
  nums.each do |num|
    sum += num
    count, sum = count+1, num if sum > mid
  end
  count + 1 <= m
end

# @param {Integer[]} nums
# @param {Integer} m
# @return {Integer}
def split_array(nums, m)
  return nums.sum if m == 1
  low, high, ans = nums.max, nums.sum, -1
  while low <= high
    mid = (low+high)/2
    if is_valid(nums, m, mid)
      ans, high = mid, mid-1
    else
      low = mid + 1
    end
  end
  ans
end

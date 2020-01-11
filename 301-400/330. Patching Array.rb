# @param {Integer[]} nums
# @param {Integer} n
# @return {Integer}
def min_patches(nums, n)
  nums = nums.sort.reject { |num| num > n }

  tmp = nums[0] == 1 ? 1 : 0
  i = nums[0] == 1 ? 1 : 0
  while nums[i] && (nums[i] - nums[i-1] == 1)
    tmp += nums[i]
    i += 1
  end
  count = 0
  while tmp < n
    if nums[i]
      if tmp + 1 < nums[i]
        tmp = tmp * 2 + 1
        count += 1
      elsif tmp + 1 > nums[i]
        tmp += nums[i]
        i += 1
      else
        tmp = tmp * 2 + 1
        i += 1
      end
    else
      tmp = tmp * 2 + 1
      count += 1
    end
  end
  count
end

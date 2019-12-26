# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def three_sum_closest(nums, target)
  nums = nums.sort
  n = nums.length
  ans = 1<<31
  nums[0..-2].each_with_index do |ele, i|
    j = i + 1
    k = n - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      ans = sum if (sum - target).abs < (ans - target).abs
      if sum==target
          ans = sum
          j += 1
          k -= 1
      elsif sum > target
        k -= 1
      else 
        j += 1
      end
    end
  end
  ans
end

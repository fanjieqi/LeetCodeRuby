# @param {Integer[]} nums
# @return {Integer[][]}
def three_sum(nums)
  nums = nums.sort
  n = nums.length
  ans = []
  nums[0..-2].each_with_index do |ele, i|
    j = i + 1
    k = n - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      if sum==0
          ans << [nums[i], nums[j], nums[k]]
          j += 1 while (nums[j] == nums[j+1] && j < k)
          k -= 1 while (nums[k] == nums[k-1] && j < k)
          j += 1
          k -= 1
      elsif sum > 0
        k -= 1
      else 
        j += 1
      end
    end
  end
  ans.map(&:sort).uniq
end

def three_sum(nums, target)
  nums = nums.sort
  n = nums.length
  ans = []
  nums[0..-2].each_with_index do |ele, i|
    j = i + 1
    k = n - 1
    while j < k
      sum = nums[i] + nums[j] + nums[k]
      if sum == target
          ans << [nums[i], nums[j], nums[k]]
          j += 1 while (nums[j] == nums[j+1] && j < k)
          k -= 1 while (nums[k] == nums[k-1] && j < k)
          j += 1
          k -= 1
      elsif sum > target
        k -= 1
      else 
        j += 1
      end
    end
  end
  ans.map(&:sort).uniq
end

# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[][]}
def four_sum(nums, target)
  ans = []
  nums[0..-4].each_with_index do |num, i|
    result = three_sum(nums[i+1..-1], target - num)
    ans += result.map{|ele| ele += [num]} if result.length > 0
  end
  ans.map(&:sort).uniq
end

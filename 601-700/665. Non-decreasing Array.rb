# @param {Integer[]} nums
# @return {Boolean}
def check_possibility(nums)
  return true if nums.size <= 1
  i = (0..nums.size-2).find { |i| nums[i] > nums[i+1] }
  return true if i.nil?

  tmp = nums.delete_at(i)
  return true if (0..nums.size-2).find { |i| nums[i] > nums[i+1] }.nil?

  nums.insert(i, tmp)
  nums.delete_at(i+1)
  
  (0..nums.size-2).find { |i| nums[i] > nums[i+1] }.nil?
end

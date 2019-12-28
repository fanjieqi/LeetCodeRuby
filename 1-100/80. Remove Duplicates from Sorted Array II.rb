# @param {Integer[]} nums
# @return {Integer}
def remove_duplicates(nums)
  return 0 if nums.length == 0
  ele = nums[0]
  flag = false
  count = 0
  (1..nums.length-1).each do |i|
    num = nums[i]
    if num != ele
      ele = num
      nums[count += 1] = nums[i]
      flag = false
    elsif flag == false
      nums[count += 1] = nums[i]
      flag = true
    end
  end
  count + 1
end

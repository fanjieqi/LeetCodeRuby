# @param {Integer[]} nums
# @return {String[]}
def summary_ranges(nums)
  return nums.map(&:to_s) if nums.length <= 1
  tmp = nums[0]
  i = 0
  ans = []
  while i + 1 <= nums.length - 1
    i += 1 while i + 1 <= nums.length - 1 && nums[i+1] - nums[i] == 1
    if tmp < nums[i]
      ans << tmp.to_s + "->" + nums[i].to_s
    else
      ans << tmp.to_s
    end
    tmp = nums[i+=1]
  end
  ans << tmp.to_s if tmp
  ans
end

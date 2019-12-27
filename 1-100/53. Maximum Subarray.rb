# @param {Integer[]} nums
# @return {Integer}
def max_sub_array(nums)
  f = [nums[0]]
  (1..nums.length-1).each do |i|
    f[i] = [nums[i], f[i-1]+nums[i]].max
  end
  f.max
end

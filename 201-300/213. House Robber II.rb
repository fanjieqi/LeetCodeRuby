def normal_rob(nums)
  return 0 if nums.length == 0
  return nums[0] if nums.length == 1
  return nums.max if nums.length == 2

  f = nums[0..1]
  (2..nums.length-1).each do |i|
    f[i] = nums[i]
    (0..i-2).each do |j|
      f[i] = [f[j] + nums[i], f[i]].max
    end
  end
  f.max
end

# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
  [normal_rob(nums[0..-2]), normal_rob(nums[1..-1])].max
end

p rob([2,3,2])
p rob([1,2,3,1])

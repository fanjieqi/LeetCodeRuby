# @param {Integer[]} nums
# @return {Integer}
def jump(nums)
  f = [0]
  (1..nums.length-1).each { |i| f[i] = 1 << 31 } 
  i = 0
  while i < nums.length - 1
    if (i+nums[i] < nums.length - 1) && (f[i+nums[i]].to_i <= f[i])
      i += 1
      next
    end
    max = [nums[i], nums.length-1 - i].min
    (1..max).each do |j|
      f[i+j] = [f[i] + 1, f[i+j]].min
    end
    i += 1
  end
  f[nums.length - 1]
end

# @param {Integer[]} nums
# @return {Boolean}
def can_jump(nums)
  f = [true]
  i = 0
  while i < nums.length - 1
    i += 1 while (i+nums[i] < nums.length - 1) && f[i+nums[i]] && f[i]
    max = [nums[i], nums.length-1 - i].min
    (1..max).each do |j|
      f[i+j] = f[i] || f[i+j]
    end
    i += 1
  end
  !!f[nums.length - 1]
end

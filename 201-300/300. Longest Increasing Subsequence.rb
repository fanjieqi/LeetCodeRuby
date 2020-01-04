# @param {Integer[]} nums
# @return {Integer}
def length_of_lis(nums)
  return 0 if nums.length == 0
  f = [1]
  (1..nums.length - 1).each do |i|
    f[i] = 1
    (0..i-1).each do |j|
      f[i] = [f[i], f[j] + 1].max if nums[j] < nums[i]
    end
  end
  f.max
end

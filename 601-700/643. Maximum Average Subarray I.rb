# @param {Integer[]} nums
# @param {Integer} k
# @return {Float}
def find_max_average(nums, k)
  f = []
  (0..nums.size-k).each do |i|
    f[i] = (i == 0 ? nums[0..k-1].sum : (f[i-1] - nums[i-1] + nums[i+k-1]))
  end
  f.max / k.to_f
end

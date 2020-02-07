# @param {Integer[]} nums
# @param {Integer} k
# @return {Boolean}
def check_subarray_sum(nums, k)
  f = [nums[0]]
  nums.each_with_index do |num, i|
    f[i] = f[i-1] + nums[i] if i > 0
  end
  (0..f.size-2).any? do |i|
    (i+1..f.size-1).any? do |j|
      (f[j] - f[i] + nums[i]) == k || k != 0 && (f[j] - f[i] + nums[i]) % k == 0
    end
  end
end

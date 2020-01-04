# @param {Integer[]} nums
# @return {Integer}
def max_coins(nums)
  return 0 if nums.length == 0
  return nums[0] if nums.length == 1
  n = nums.length
  nums.unshift(1)
  nums << 1

  f = []
  (1..n).each do |i|
    (1..n-i+1).each do |l|
      f[l] ||= []
      r = l + i - 1;
      f[l][r] ||= 0
      (l..r).each do |k|
        f[l][k-1] ||= 0
        f[k+1] ||= []
        f[k+1][r] ||= 0
        f[l][r] = [f[l][r], nums[l-1] * nums[k] * nums[r+1] + f[l][k-1] + f[k+1][r]].max
      end
    end
  end
  f[1][n]
end

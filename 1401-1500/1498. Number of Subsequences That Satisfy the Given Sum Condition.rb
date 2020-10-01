MOD = 10**9 + 7
# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer}
def num_subseq(nums, target)
  pow = [1]
  (1..nums.size).each { |i| pow[i] = (pow[i-1] << 1) % MOD }
  nums.sort!
  l, r = 0, nums.size - 1
  count = 0
  while l <= r
    if nums[l] + nums[r] > target
      r -= 1
    else
      count += pow[r-l]
      l += 1
    end
  end
  count % MOD
end

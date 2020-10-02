MOD = 10**9 + 7
# @param {Integer[]} nums
# @param {Integer} n
# @param {Integer} left
# @param {Integer} right
# @return {Integer}
def range_sum(nums, n, left, right)
  n, sum = nums.size, [0]
  nums.each_with_index { |num, i| sum[i+1] = sum[i] + num }
  arr = []
  (0..n-1).each do |i|
    (i..n-1).each do |j|
      arr << sum[j+1] - sum[i]
    end
  end
  arr.sort[left-1..right-1].sum % MOD
end

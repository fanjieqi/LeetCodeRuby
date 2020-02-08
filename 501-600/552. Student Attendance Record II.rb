# @param {Integer} n
# @return {Integer}
def check_record(n)
  return n * 3 if n < 2
  nums = [1]
  nums << (nums.length <= 3 ? nums.reverse[0..2].sum : nums[-3..-1].sum) % 1000000007 while nums.length <= n + 1
  (0..nums.size-2).map { |i| nums[i] * nums[-i-1] }.sum % 1000000007
end

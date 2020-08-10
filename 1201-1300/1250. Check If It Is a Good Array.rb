# @param {Integer[]} nums
# @return {Boolean}
def is_good_array(nums)
  nums.inject(nums[0]) { |tmp, num| tmp = tmp.gcd(num) } == 1
end

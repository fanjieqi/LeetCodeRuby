# @param {Integer[]} nums
# @return {Boolean}
def xor_game(nums)
  nums.inject(&:^) == 0 || nums.size.even?
end

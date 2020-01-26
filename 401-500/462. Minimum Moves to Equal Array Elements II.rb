# @param {Integer[]} nums
# @return {Integer}
def min_moves2(nums)
  median = nums.sort[nums.length / 2]
  nums.inject(0){|sum, num| sum += (num-median).abs}
end

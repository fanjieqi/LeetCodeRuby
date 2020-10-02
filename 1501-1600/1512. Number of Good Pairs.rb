# @param {Integer[]} nums
# @return {Integer}
def num_identical_pairs(nums)
  hash = {}
  nums.each { |num| hash[num] = hash[num].to_i + 1 }
  count = 0
  hash.each { |num, tmp| count += tmp * (tmp-1) / 2 }
  count
end

# @param {Integer[]} nums
# @return {Integer}
def find_numbers(nums)
  nums.select { |num| num.to_s.size.even? }.count
end

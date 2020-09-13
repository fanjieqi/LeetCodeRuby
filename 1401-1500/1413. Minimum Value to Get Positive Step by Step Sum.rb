# @param {Integer[]} nums
# @return {Integer}
def min_start_value(nums)
  min, sum = 0, 0
  nums.each do |num|
    sum += num
    min = sum if sum < min
  end
  -min + 1
end

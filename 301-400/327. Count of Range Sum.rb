# @param {Integer[]} nums
# @param {Integer} lower
# @param {Integer} upper
# @return {Integer}
def count_range_sum(nums, lower, upper)
  sums = [0]
  nums.each_with_index do |num, i|
    sums[i+1] = sums[i] + num
  end
  hash = {}
  count = 0
  sums.each do |sum|
    (lower..upper).each do |tmp|
      count += hash[sum-tmp].to_i
    end
    hash[sum] ||= 0
    hash[sum] += 1
  end
  count
end

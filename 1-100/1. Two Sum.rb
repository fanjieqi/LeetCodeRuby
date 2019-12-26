# @param {Integer[]} nums
# @param {Integer} target
# @return {Integer[]}
def two_sum(nums, target)
  nums.each_with_index do |a, i|
    nums[i+1..-1].each_with_index do |b, j|
      return [i, i + j + 1] if (a + b == target)
    end
  end
end

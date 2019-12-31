# @param {Integer[]} nums
# @return {Integer}
def find_peak_element(nums)
  nums.each_with_index do |num, i|
    return i if (i == 0 || num > nums[i-1]) && (i == nums.length-1 || num > nums[i+1])
  end
end

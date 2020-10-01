# @param {Integer[]} nums
# @return {Integer}
def longest_subarray(nums)
  return nums.size-1 if nums.all?(&:positive?)
  arr = []
  nums.each do |num|
    if num == 0
      arr << 0
    else
      arr << 0 if arr[-1].nil?
      arr[-1] = arr[-1].to_i + 1
    end
  end
  (0..arr.size-1).map { |i| arr[i] + arr[i+1].to_i }.max
end

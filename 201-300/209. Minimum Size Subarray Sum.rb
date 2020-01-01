# @param {Integer} s
# @param {Integer[]} nums
# @return {Integer}
def min_sub_array_len(s, nums)
  return 0 if nums.length == 0
  sums = [0]
  (0..nums.length-1).each { |i| sums[i+1] = sums[i] + nums[i] }
  return 0 if sums.last < s

  min = nums.length
  (0..nums.length-1).each do |i|
    l = [i+min, nums.length].min
    (l).downto(i) do |j|
      break if sums[j] - sums[i] < s
      min = [min, j-i].min
    end
  end
  min
end

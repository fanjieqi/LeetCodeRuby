# @param {Integer[]} nums
# @return {Integer[]}
def next_greater_elements(nums)
  nums3 = []
  nums2 = nums + nums
  (nums.length-1).downto(0) do |i|
    k = nums2[i+1..-1].index{|x| x > nums2[i]}
    nums3[i] = k ? nums2[i+1+k] : -1
  end
  nums3
end

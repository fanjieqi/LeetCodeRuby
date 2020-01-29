# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def next_greater_element(nums1, nums2)
  nums3 = []
  (nums2.length-1).downto(0) do |i|
    k = nums2[i+1..-1].index{|x| x > nums2[i]}
    nums3[i] = k ? nums2[i+1+k] : -1
  end

  nums1.map do |num| 
    k = nums2.index(num)
    k ? nums3[k] : -1
  end
end

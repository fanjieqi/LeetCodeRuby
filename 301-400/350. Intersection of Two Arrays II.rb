# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer[]}
def intersect(nums1, nums2)
  h1 = nums1.group_by(&:itself).transform_values(&:count)
  h2 = nums2.group_by(&:itself).transform_values(&:count)
  (h1.keys & h2.keys).map {|k| [k] * [h1[k], h2[k]].min }.flatten
end

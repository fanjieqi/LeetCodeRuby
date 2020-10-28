def prep(nums, k)
  drop = nums.size - k
  out = [9]
  nums.each do |num|
    while drop > 0 && out[-1] < num
      out.pop
      drop -= 1
    end
    out << num
  end
  out[1..k]
end

# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @param {Integer} k
# @return {Integer[]}
def max_number(nums1, nums2, k)
  ([k-nums2.size, 0].max .. [nums1.size, k].min).map { |k1|
    parts = [prep(nums1, k1), prep(nums2, k-k1)]
    (1..k).map { parts.max.shift }
  }.max
end

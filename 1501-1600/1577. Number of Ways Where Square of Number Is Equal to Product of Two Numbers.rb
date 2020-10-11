# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def num_triplets(nums1, nums2)
  n1, n2, hash1, hash2 = nums1.size, nums2.size, {}, {}
  nums1.each { |num| tmp = num*num; hash1[tmp] = hash1[tmp].to_i + 1 }
  nums2.each { |num| tmp = num*num; hash2[tmp] = hash2[tmp].to_i + 1 }
  count = 0
  (0..n1-2).each do |i|
    (i+1..n1-1).each do |j|
      tmp = nums1[i] * nums1[j]
      count += hash2[tmp].to_i
    end
  end
  (0..n2-2).each do |i|
    (i+1..n2-1).each do |j|
      tmp = nums2[i] * nums2[j]
      count += hash1[tmp].to_i
    end
  end

  count
end

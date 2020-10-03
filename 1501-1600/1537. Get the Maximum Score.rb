MOD = 10**9 + 7
# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_sum(nums1, nums2)
  map = {}
  (0..nums1.size-2).each do |i|
    map[nums1[i]] ||= []
    map[nums1[i]] << nums1[i+1]
  end
  (0..nums2.size-2).each do |i|
    map[nums2[i]] ||= []
    map[nums2[i]] << nums2[i+1]
  end

  dist = {}
  dist[nums1[0]] = nums1[0]
  dist[nums2[0]] = nums2[0]

  map.keys.sort.each do |u|
    map[u]&.each do |v|
      tmp = dist[u] + v
      next if dist[v] && tmp <= dist[v]
      dist[v] = tmp
    end
  end

  [dist[nums1[-1]], dist[nums2[-1]]].max % MOD
end

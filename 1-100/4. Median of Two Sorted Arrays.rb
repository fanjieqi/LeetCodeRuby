# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Float}
def find_median_sorted_arrays(nums1, nums2)
  m, n = nums1.count, nums2.count
  nums1, nums2, m, n = nums2, nums1, n, m if m > n

  imin, imax, half_len = 0, m, (m + n + 1) / 2

  while imin <= imax
    i = (imin + imax) / 2
    j = half_len - i
    if i < m and nums2[j-1] > nums1[i]
      imin = i + 1
    elsif i > 0 and nums1[i-1] > nums2[j]
      imax = i - 1
    else

      if i == 0
        max_of_left = nums2[j-1]
      elsif j == 0
        max_of_left = nums1[i-1]
      else
        max_of_left = [ nums1[i-1], nums2[j-1] ].max
      end

      return max_of_left if (m + n) % 2 == 1

      if i == m
        min_of_right = nums2[j]
      elsif j == n
        min_of_right = nums1[i]
      else
        min_of_right = [ nums1[i], nums2[j] ].min
      end

      return (max_of_left + min_of_right) / 2.0
    end
  end
end

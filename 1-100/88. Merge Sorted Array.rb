# @param {Integer[]} nums1
# @param {Integer} m
# @param {Integer[]} nums2
# @param {Integer} n
# @return {Void} Do not return anything, modify nums1 in-place instead.
def merge(nums1, m, nums2, n)
  l = m + n - 1
  while l > 0 || m > 0 || n > 0
    while m > 0 && n == 0 || (m > 0 && n > 0 && nums1[m-1] >= nums2[n-1])
      m -= 1
      nums1[l] = nums1[m]
      l -= 1
    end
    while n > 0 && m == 0 || (m > 0 && n > 0 && nums1[m-1] <= nums2[n-1])
      n -= 1
      nums1[l] = nums2[n]
      l -= 1
    end
  end
  nums1
end

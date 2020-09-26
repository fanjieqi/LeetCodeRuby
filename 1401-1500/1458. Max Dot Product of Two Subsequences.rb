# @param {Integer[]} nums1
# @param {Integer[]} nums2
# @return {Integer}
def max_dot_product(nums1, nums2)
  f = [[]]
  nums1.each_with_index do |num1, i|
    f[i] = f[i-1].clone
    nums2.each_with_index do |num2, j|
      cur = num1 * num2
      f[i][j] = cur if f[i][j].nil? || cur > f[i][j]
      f[i][j] = f[i][j-1] if j > 0 && f[i][j-1] > f[i][j]
      next if i == 0 || j == 0
      cur += f[i-1][j-1]
      f[i][j] = cur if cur > f[i][j]
      f[i][j] = f[i-1][j-1] if f[i-1][j-1] > f[i][j]
    end
  end
  f.flatten.compact.max
end

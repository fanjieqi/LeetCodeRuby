# @param {Integer[]} digits
# @return {String}
def largest_multiple_of_three(digits)
  nums1 = digits.select { |digit| digit % 3 == 0 }.sort.reverse
  nums2 = digits.select { |digit| digit % 3 == 0 }.sort.reverse
  mod1 = digits.select { |digit| digit % 3 == 1 }.sort.reverse
  mod2 = digits.select { |digit| digit % 3 == 2 }.sort.reverse

  l1, l2 = mod1.size, mod2.size
  i1, i2 = l1/3*3, l2/3*3
  nums1 += mod1[0, i1]
  nums1 += mod2[0, i2]

  r1, r2 = l1 - i1, l2 - i2
  r = [r1, r2].min
  nums1 += mod1[i1, r]
  nums1 += mod2[i2, r]
  nums1.sort!.reverse!

  l = [l1, l2].min
  nums2 += mod1[0, l]
  nums2 += mod2[0, l]
  nums2 += mod1[l, (l1 - l)/3 * 3] if l1 > l
  nums2 += mod2[l, (l2 - l)/3 * 3] if l2 > l
  nums2.sort!.reverse!

  if nums1.empty? && nums2.empty?
    ""
  elsif nums1.empty?
    nums2.join.to_i.to_s
  elsif nums2.empty?
    nums1.join.to_i.to_s
  else
    [nums1.join.to_i, nums2.join.to_i].max.to_s
  end
end

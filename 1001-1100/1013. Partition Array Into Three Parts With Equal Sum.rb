# @param {Integer[]} a
# @return {Boolean}
def can_three_parts_equal_sum(a)
  sum = [0]
  (1..a.size).each { |i| sum[i] = a[i-1] + sum[i-1] }
  # p sum
  total = a.sum
  return false if total % 3 != 0
  avg = total / 3
  
  i = (0..a.size-1).find { |l| sum[l+1] == avg }
  return false if i.nil? || i == a.size-1
  j = (i+1..a.size-1).find { |l| sum[l+1] - sum[i+1] == avg}
  !j.nil? && j < a.size-1
end

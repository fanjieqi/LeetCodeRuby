# @param {String} s
# @param {String} t
# @param {Integer} max_cost
# @return {Integer}
def equal_substring(s, t, max_cost)
  n = s.size
  sum = [0]
  (0..n-1).each { |i| sum[i+1] = sum[i] + (s[i].ord - t[i].ord).abs }

  l, r = 0, n
  while l < r
    mid = (l + r) / 2
    if (0..n-mid-1).any? { |i| sum[i+mid+1] - sum[i] <= max_cost }
      l = mid+1
    else
      r = mid
    end
  end
  l
end

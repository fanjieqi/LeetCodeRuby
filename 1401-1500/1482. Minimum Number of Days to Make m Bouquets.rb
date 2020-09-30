# @param {Integer[]} bloom_day
# @param {Integer} m
# @param {Integer} k
# @return {Integer}
def min_days(bloom_day, m, k)
  return -1 if bloom_day.size < m * k
  n, l, r = bloom_day.size, bloom_day.min, bloom_day.max
  while l < r
    mid = (l + r) / 2
    tmp, count = 0, 0
    bloom_day.each_with_index do |num, i|
      tmp += 1 if num <= mid 
      if num > mid || i == n-1
        count += (tmp / k)
        tmp = 0
      end
      break if count >= m
    end
    if count < m
      l = mid + 1
    else
      r = mid
    end
  end
  l
end

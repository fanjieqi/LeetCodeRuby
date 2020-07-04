# @param {Integer[]} weights
# @param {Integer} d
# @return {Integer}
def ship_within_days(weights, d)
  l, r = weights.max, weights.sum
  while l < r
    mid, need, cur = (l + r) / 2, 1, 0
    weights.each do |weight|
      if cur + weight > mid
        need += 1
        cur = 0
      end
      cur += weight
    end
    if need > d
      l = mid + 1
    else
      r = mid
    end
  end
  l
end

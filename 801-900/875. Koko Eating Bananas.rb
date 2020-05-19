# @param {Integer[]} piles
# @param {Integer} h
# @return {Integer}
def min_eating_speed(piles, h)
  l, r = 1, piles.sum
  min = r
  while l <= r
    mid = (l + r) / 2
    tmp = piles.inject(0) { |sum, pile| sum += (pile / mid.to_f).ceil }
    if tmp <= h
      r = mid-1
      min = mid if mid < min
    elsif tmp > h
      l = mid+1
    end
  end
  min
end

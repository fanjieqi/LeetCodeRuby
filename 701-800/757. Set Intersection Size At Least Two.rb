# @param {Integer[][]} intervals
# @return {Integer}
def intersection_size_two(intervals)
  l, r, count = -1, -1, 0
  intervals.sort_by(&:last).each do |ll, rr|
    if ll > r
      count, l, r = count + 2, rr - 1, rr
    elsif l < ll && ll <= r
      count, l, r = count + 1, r, rr
    end
  end
  count
end

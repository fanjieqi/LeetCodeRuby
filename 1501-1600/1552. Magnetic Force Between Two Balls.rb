def count(d)
  count, curr = 1, @position[0]
  (1..@n-1).each do |i|
    next if @position[i] - curr < d
    count += 1
    curr = @position[i]
  end

  count
end
# @param {Integer[]} position
# @param {Integer} m
# @return {Integer}
def max_distance(position, m)
  @n, @position = position.size, position.sort
  l, r = 0, @position[-1] - @position[0]
  while l < r
    mid = r - (r - l) / 2
    if count(mid) >= m
      l = mid
    else
      r = mid - 1
    end
  end
  r
end

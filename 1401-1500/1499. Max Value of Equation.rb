# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer}
def find_max_value_of_equation(points, k)
  max, r = nil, 1
  points.each_with_index do |(x1, y1), i|
    r = i + 1 if i >= r
    (r..points.size-1).each do |j|
      x2, y2 = points[j]
      break if x2 - x1 > k
      tmp = x2 - x1 + y1 + y2
      next if max && tmp < max
      max = tmp
      r = j
    end
  end
  max
end

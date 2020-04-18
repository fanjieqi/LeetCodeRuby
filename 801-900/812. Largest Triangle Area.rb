# @param {Integer[][]} points
# @return {Float}
def largest_triangle_area(points)
  points.combination(3).map do |p1, p2, p3|
    (p1[0]*p2[1]+p2[0]*p3[1]+p3[0]*p1[1]-p1[0]*p3[1]-p2[0]*p1[1]-p3[0]*p2[1]).abs/2.0
  end.max
end

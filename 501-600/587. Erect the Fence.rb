def cross(p1, p2, p3)
  (p2[0] - p1[0])*(p3[1] - p1[1]) - (p2[1] - p1[1])*(p3[0] - p1[0])
end

def slope(p1, p2)
  p1[0] != p2[0] ? (p1[1]-p2[1])/(p1[0]-p2[0]).to_f : Float::INFINITY
end

def outer_trees(points)
  points.sort!
  start = points.shift
  points = points.sort_by {|point| [slope(point, start), -point[1], point[0]] }

  ans = [start]
  points.each do |point|
    ans << point
    ans.delete_at(-2) while ans.length > 2 && cross(ans[-3], ans[-2], ans[-1]) < 0
  end
  ans
end

# @param {Integer[][]} points
# @return {Boolean}
def is_boomerang(points)
  points.sort!
  if points.uniq.size < 3
    false
  elsif (points[1][0]-points[0][0]).zero?
    !(points[2][0]-points[1][0]).zero?
  elsif (points[2][0]-points[1][0]).zero?
    !(points[1][0]-points[0][0]).zero?
  elsif (points[1][1]-points[0][1]).zero?
    !(points[2][1]-points[1][1]).zero?
  elsif (points[2][1]-points[1][1]).zero?
    !(points[1][1]-points[0][1]).zero?
  else
    points.uniq.size == 3 && (points[1][1]-points[0][1]).to_r / (points[1][0]-points[0][0]).to_r != (points[2][1]-points[1][1]).to_r / (points[2][0]-points[1][0]).to_r
  end
end

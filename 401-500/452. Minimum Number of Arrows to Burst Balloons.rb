# @param {Integer[][]} points
# @return {Integer}
def find_min_arrow_shots(points)
  return 0 if points.length == 0
  points.sort!
  arr = points[0..0]
  i = 0
  (1..points.length-1).each do |j|
    if arr[-1][1] >= points[j][0]
      arr[-1][0] = [arr[-1][0], points[j][0]].max
      arr[-1][1] = [arr[-1][1], points[j][1]].min
    else
      arr << points[j]
    end
  end
  arr.length
end

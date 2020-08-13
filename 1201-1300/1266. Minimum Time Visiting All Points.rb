# @param {Integer[][]} points
# @return {Integer}
def min_time_to_visit_all_points(points)
  sx, sy = points.shift
  seconds = 0
  points.each do |tx, ty|
    if sx == tx
      seconds += (ty - sy).abs
    elsif sy == ty
      seconds += (tx - sx).abs
    elsif (ty - sy).abs >= (tx - sx).abs
      seconds += (ty - sy).abs
    else
      seconds += (tx - sx).abs
    end
    sx, sy = tx, ty
  end
  seconds
end

# @param {Integer[][]} coordinates
# @return {Boolean}
def check_straight_line(coordinates)
  xs = coordinates.map(&:first)
  count_x = xs.uniq.size
  ys = coordinates.map(&:last)
  count_y = ys.uniq.size
  if count_x < xs.size
    count_x == 1
  elsif count_y < ys.size
    count_y == 1
  else
    coordinates.sort!
    (0..coordinates.size-2).map { |i| ((coordinates[i+1][1]-coordinates[i][1]) / (coordinates[i+1][0]-coordinates[i][0])).to_r }.uniq.size == 1
  end
end

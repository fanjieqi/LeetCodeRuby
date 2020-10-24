# @param {Integer[][]} towers
# @param {Integer} radius
# @return {Integer[]}
def best_coordinate(towers, radius)
  minx, maxx = towers.map(&:first).min, towers.map(&:first).max
  miny, maxy = towers.map { |tower| tower[1] }.min, towers.map { |tower| tower[1] }.max
  max, mx, my = 0, 0, 0
  (minx..maxx).each do |x|
    (miny..maxy).each do |y|
      quality = 0
      towers.each do |tower|
        xd = x - tower[0]
        yd = y - tower[1]
        d = Math.sqrt(xd * xd + yd * yd)
        quality += (tower[2] / (1.0 + d)).to_i if d <= radius
      end
      # p [:quantity, x, y, quality, max] if x == 42 || x == 45
      next if quality <= max
      max = quality
      mx, my = x, y
    end
  end

 [mx, my]
end

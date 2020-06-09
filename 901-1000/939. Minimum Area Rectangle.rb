MAX = 1 << 31
# @param {Integer[][]} points
# @return {Integer}
def min_area_rect(points)
  hashx, hashy = {}, {}
  points.each do |x, y|
    hashx[x] ||= {}
    hashx[x][y] = true
    hashy[y] ||= {}
    hashy[y][x] = true
  end
  min = MAX
  return 0 if hashx.size == 1 || hashy.size == 1
  hashx.each do |x1, y1s|
    y1s.each do |y1, _|
      next if hashy[y1].nil?
      hashy[y1].each do |x2, _|
        next if x1 == x2 || hashx.dig(x2, y1).nil?
        hashx[x2].each do |y2, _|
          next if y1 == y2 || hashy.dig(y2, x1).nil?
          size = (x1-x2).abs * (y1-y2).abs
          next if size > min
          min = size
        end
      end
    end
  end

  min == MAX ? 0 : min
end

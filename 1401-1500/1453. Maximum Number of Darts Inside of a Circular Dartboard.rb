# @param {Integer[][]} points
# @param {Integer} r
# @return {Integer}
def num_points(points, r)
  res, rr = 1, r*r
  points.combination(2).each do |(x1, y1), (x2, y2)|
    d = ((x1-x2)**2 + (y1-y2)**2) / 4.0
    next if d > rr
    x0 = (x1 + x2) / 2.0 + (y2-y1) * (rr - d)**0.5 / (d * 4) ** 0.5
    y0 = (y1 + y2) / 2.0 - (x2-x1) * (rr - d)**0.5 / (d * 4) ** 0.5
    tmp = points.inject(0) { |sum, (x, y)| sum + (((x-x0)**2 + (y-y0)**2 <= rr +0.00001) ? 1 : 0) }
    res = tmp if tmp > res
  end
  res
end

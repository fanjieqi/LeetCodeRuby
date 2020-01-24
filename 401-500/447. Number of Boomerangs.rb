# @param {Integer[][]} points
# @return {Integer}
def number_of_boomerangs(points)
  f = []
  ans = 0
  points.each_with_index do |p1, i|
    f[i] = {}
    points.each_with_index do |p2, j|
      next if i == j
      dis = (p1[0]-p2[0])**2 + (p1[1]-p2[1])**2
      f[i][dis] ||= 0
      f[i][dis] += 1
    end
    ans += f[i].values.inject(0){|sum, i| sum += i * (i-1)}
  end
  ans
end

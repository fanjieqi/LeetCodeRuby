# @param {Integer[][]} points
# @return {Float}
def min_area_free_rect(points)
  n = points.size

  dis, lines = [], {}
  (0..n-2).each do |i|
    dis[i] ||= []
    (i+1..n-1).each do |j|
      dis[j] ||= []
      line = (points[i][0] - points[j][0])**2 + (points[i][1] - points[j][1])**2

      dis[i][j] = line
      dis[j][i] = line
      lines[line] ||= []
      lines[line] << [i, j]
    end
  end

  min = nil
  (0..n-2).each do |i|
    (i+1..n-1).each do |j|
      l1 = dis[i][j]
      lines[l1].each do |k, l|
        next if i == k || i == l || j == k || j == l || dis[i][k] == dis[j][k] || dis[i][l] == dis[j][l]
        l3 = [dis[i][k], dis[i][l]].min
        l4 = [dis[j][k], dis[j][l]].min
        l5 = [dis[i][k], dis[i][l]].max
        l6 = [dis[j][k], dis[j][l]].max
        next if l3 != l4 || l5 != l6
        area = Math.sqrt(l1) * Math.sqrt(l3)
        min = area if min.nil? || area < min
      end
    end
  end

  min || 0
end

def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer[][]} points
# @return {Integer}
def min_cost_connect_points(points)
  n, edges, @father, total = points.size, [], [], 0
  (0..n-2).each do |i|
    (i+1..n-1).each do |j|
      cost = (points[i][0] - points[j][0]).abs + (points[i][1] - points[j][1]).abs
      edges << [i, j, cost]
    end
  end
  edges.sort_by(&:last).each do |edge|
    u, v, cost = edge
    fu, fv = get_father(u), get_father(v)
    next if fu == fv
    @father[fu] = fv
    total += cost
  end
  total
end

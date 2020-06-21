# @param {Integer[][]} points
# @param {Integer} k
# @return {Integer[][]}
def k_closest(points, k)
  points.sort_by { |point| point[0]**2 + point[1]**2 }[0,k]
end

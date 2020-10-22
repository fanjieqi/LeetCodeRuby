def calculate_radian(vec, vector)
  Math.atan2( vec[0]*vector[1]-vec[1]*vector[0], vec[0]*vector[0]+vec[1]*vector[1] ) % (Math::PI * 2)
end

# @param {Integer[][]} points
# @param {Integer} angle
# @param {Integer[]} location
# @return {Integer}
def visible_points(points, angle, location)
  vec, angle = [1, 0], angle * Math::PI / 180.0
  originals = points.select { |point| point == location }
  points.delete(location)
  vectors = points.map { |point| [point[0] - location[0], point[1] - location[1]] }
  vectors.sort_by! { |vector| calculate_radian(vec, vector) }
  double, max = vectors + vectors, 0
  (0..vectors.size-1).each do |i|
    count = double[i..i+vectors.size-1].bsearch_index { |vector| calculate_radian(vectors[i], vector) > angle } || vectors.size
    max = count if count > max
  end
  max + originals.size
end

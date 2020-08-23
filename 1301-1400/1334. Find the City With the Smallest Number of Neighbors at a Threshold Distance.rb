# @param {Integer} n
# @param {Integer[][]} edges
# @param {Integer} distance_threshold
# @return {Integer}
def find_the_city(n, edges, distance_threshold)
  map = {}
  edges.each do |i, j, weight|
    next if weight > distance_threshold
    map[i] ||= {}
    map[i][j] = weight
    map[j] ||= {}
    map[j][i] = weight
  end
  (0..n-1).each do |k|
    map[k] ||= {}
    (0..n-1).each do |i|
      next if k == i
      map[i] ||= {}
      next if map.dig(i, k).nil?
      (0..n-1).each do |j|
        next if i == j || k == j || map.dig(k, j).nil?
        tmp = map[i][k] + map[k][j]
        next if tmp > distance_threshold
        map[i][j] = tmp if map.dig(i, j).nil? || tmp < map[i][j]
      end
    end
  end
  sizes = (0..n-1).map { |i| map[i].size }
  min = sizes.min
  sizes.rindex(min)
end

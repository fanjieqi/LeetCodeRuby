# @param {Integer} n
# @param {Integer[][]} preferences
# @param {Integer[][]} pairs
# @return {Integer}
def unhappy_friends(n, preferences, pairs)
  map, outo, count = {}, preferences.map(&:size), 0
  preferences.each_with_index do |vs, u|
    map[u] = []
    vs.each_with_index { |v, i| map[u][v] = i }
  end

  hash = pairs.to_h
  hash.merge!(hash.invert)

  pairs.each do |x, y|
    count += 1 if preferences[x].any? { |u| map[x][u] < map[x][y] && map[u][x] < map[u][hash[u]] }
    count += 1 if preferences[y].any? { |u| map[y][u] < map[y][x] && map[u][y] < map[u][hash[u]] }
  end

  count
end

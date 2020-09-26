# @param {Integer} n
# @param {Integer[][]} prerequisites
# @param {Integer[][]} queries
# @return {Boolean[]}
def check_if_prerequisite(n, prerequisites, queries)
  map = []
  prerequisites.each do |u, v|
    map[u] ||= []
    map[u][v] = true
  end
  (0..n-1).each do |k|
    (0..n-1).each do |u|
      next if map.dig(u, k).nil?
      (0..n-1).each do |v|
        next if map.dig(k, v).nil?
        map[u] ||= []
        map[u][v] = true
      end
    end
  end
  queries.map { |u, v| map.dig(u, v) || false }
end

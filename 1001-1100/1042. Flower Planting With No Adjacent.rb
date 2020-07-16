# @param {Integer} n
# @param {Integer[][]} paths
# @return {Integer[]}
def garden_no_adj(n, paths)
  paths = paths.map(&:sort).sort
  colors = (0..n).map{ [1, 2, 3, 4] }
  paths.each { |u, v| colors[v].delete(colors[u][0]) }
  colors[1..n].map(&:first)
end

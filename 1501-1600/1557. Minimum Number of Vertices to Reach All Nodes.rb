# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def find_smallest_set_of_vertices(n, edges)
  into = []
  edges.each { |u, v| into[v] = true }
  (0..n-1).select { |u| into[u].nil? }
end

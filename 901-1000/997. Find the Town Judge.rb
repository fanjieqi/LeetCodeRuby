# @param {Integer} n
# @param {Integer[][]} trust
# @return {Integer}
def find_judge(n, trust)
  nodes = (1..n).to_a - trust.map(&:first)
  map = []
  trust.each do |u, v|
    map[v] ||= []
    map[v] << u
  end
  rest = (1..n).select { |u| map[u].to_a.size + 1 == n } & nodes
  rest.size == 1 ? rest[0] : -1
end

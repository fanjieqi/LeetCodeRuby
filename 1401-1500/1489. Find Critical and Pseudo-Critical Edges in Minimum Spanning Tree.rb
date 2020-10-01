def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

def generate_mst(block_edge = nil, init_edge = nil)
  @father, total = {}, 0
  if init_edge
    u, v, total, j = @edges[init_edge]
    @father[get_father(u)] = get_father(v)
  end
  @edges.each_with_index do |(u, v, edge, j), k|
    next if k == block_edge
    fu, fv = get_father(u), get_father(v)
    next if fu == fv
    @father[fu] = fv
    total += edge
  end
  (0..@n-1).all? { |u| get_father(u) == get_father(0) } ? total : (1 << 31)
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[][]}
def find_critical_and_pseudo_critical_edges(n, edges)
  @n, @edges = n, edges.zip((0..edges.size-1).to_a).map(&:flatten).sort_by { |u, v, edge, j| edge }
  total = generate_mst()
  critical, pseudo = {}, {}
  @edges.each_with_index do |(u, v, edge, j), i|
    if generate_mst(i, nil) > total
      critical[j] = true
    elsif generate_mst(nil, i) == total
      pseudo[j] = true
    end
  end
  [critical.keys.sort, pseudo.keys.sort]
end

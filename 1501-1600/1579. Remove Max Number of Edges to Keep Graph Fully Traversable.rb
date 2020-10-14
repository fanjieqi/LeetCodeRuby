def get_father(type, i)
  (@father[type][i].nil? || @father[type][i] == i) ? i : @father[type][i] = get_father(type, @father[type][i])
end

def calculate(type)
  @edges.each do |edge|
    tmp, u, v = edge
    next if tmp != type
    fu, fv = get_father(type, u), get_father(type, v)
    if fu == fv
      @count += 1
    else
      @father[type][fu] = fv
    end
  end
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer}
def max_num_edges_to_remove(n, edges)
  @edges, @father, @count = edges, [], 0
  @father[3] = []
  calculate(3)

  @father[1] = @father[3].clone
  calculate(1)
  return -1 if (1..n).map { |i| get_father(1, i) }.uniq.size != 1

  @father[2] = @father[3].clone
  calculate(2)
  return -1 if (1..n).map { |i| get_father(2, i) }.uniq.size != 1

  @count
end

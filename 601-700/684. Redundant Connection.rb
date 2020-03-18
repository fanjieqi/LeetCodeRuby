def get_father(i)
  @father[i] == i ? i : @father[i] = get_father(@father[i])
end

# @param {Integer[][]} edges
# @return {Integer[]}
def find_redundant_connection(edges)
  max = edges.flatten.max
  @father = (max+1).times.map { |i| i }
  edges.each do |p1, p2|
    f1 = get_father(p1)
    f2 = get_father(p2)
    return [p1, p2] if f1 == f2
    @father[f2] = f1
  end
end

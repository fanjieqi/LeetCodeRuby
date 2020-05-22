def get_father(i)
  (@father[i].nil? || @father[i] == i) ? i : @father[i] = get_father(@father[i])
end

# @param {Integer} n
# @param {Integer[][]} dislikes
# @return {Boolean}
def possible_bipartition(n, dislikes)
  dislikes.sort!
  map = []
  dislikes.each do |x, y|
    map[x] ||= []
    map[x] << y
    map[y] ||= []
    map[y] << x
  end
  @father = []
  map.each_with_index do |nodes, x|
    next if nodes.nil?
    nodes[1..-1].each do |v|
      @father[get_father(v)] = get_father(nodes[0])
      return false if get_father(x) == get_father(v)
    end
  end
  true
end

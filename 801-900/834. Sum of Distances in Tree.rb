def postorder(parent, u)
  @map[u].each do |v|
    next if v == parent
    postorder(u, v)
    @size[u] += @size[v]
    @up[u] += @up[v] + @size[v] 
  end if @map[u]
end
          
def preorder(parent, u)
  @down[u] = @down[parent] + (@up[parent] - @up[u] - @size[u]) + (@n-@size[u]) if parent
  @map[u].each do |v|
    next if v == parent
    preorder(u, v)
  end if @map[u]
end

# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
def sum_of_distances_in_tree(n, edges)
  @map, @n = [], n
  edges.each do |u, v|
    @map[u] ||= []
    @map[u] << v
    @map[v] ||= []
    @map[v] << u
  end

  @size, @up, @down = [1] * n, [0] * n, [0] * n
              
  postorder(nil, 0)
  preorder(nil, 0)
  @up.zip(@down).map(&:sum)
end

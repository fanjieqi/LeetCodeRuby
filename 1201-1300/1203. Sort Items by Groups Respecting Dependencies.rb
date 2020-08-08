def topo_sort(map, degree)
  queue = Queue.new
  map.each { |u, vh| queue << u if degree[u].to_i.zero? }
  array = []
  while !queue.empty?
    u = queue.pop
    array << u
    map[u]&.each do |v|
      degree[v] -= 1
      queue << v if degree[v].to_i.zero?
    end
  end
  array
end

# @param {Integer} n
# @param {Integer} m
# @param {Integer[]} group
# @param {Integer[][]} before_items
# @return {Integer[]}
def sort_items(n, m, group, before_items)
  @group = group
  (0..n-1).each do |i|
    if group[i] == -1 
      group[i] = m
      m += 1
    end
  end

  @degree, @gdegree = {}, {}
  @map = (0..n-1).map { |i| [i, []] }.to_h
  @gmap = (0..m-1).map { |i| [i, []] }.to_h
  before_items.each_with_index do |items, v|
    @degree[v] = items.size
    items.each do |u|
      @map[u] << v
      next if @group[u] == @group[v]
      @gmap[@group[u]] << @group[v]
      @gdegree[@group[v]] = @gdegree[@group[v]].to_i + 1
    end
  end

  item_order = topo_sort(@map, @degree)
  group_order = topo_sort(@gmap, @gdegree)

  order_within_group = {}
  item_order.each do |v|
    order_within_group[group[v]] ||= []
    order_within_group[group[v]] << v
  end

  ans = group_order.map { |group| order_within_group[group] }.flatten.compact
  ans.size == n ? ans : []
end

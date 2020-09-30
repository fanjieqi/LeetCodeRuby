class TreeAncestor

=begin
  :type n: Integer
  :type parent: Integer[]
=end
  def initialize(n, parent)
    @map, @parents = [], [[0]]
    parent.each_with_index do |u, v|
      next if v == 0
      @map[u] ||= []
      @map[u] << v 
    end
    queue = Queue.new
    queue << 0
    while !queue.empty?
      u = queue.pop
      @map[u]&.each do |v|
        @parents[v] = [v] + @parents[u].to_a[0, 1000]
        queue << v if @map[v]
      end
    end
  end


=begin
  :type node: Integer
  :type k: Integer
  :rtype: Integer
=end
  def get_kth_ancestor(node, k)
    return node if k == 0
    return -1 if node.nil? || k <= 0 || node == 0 && k > 0
    @parents.dig(node, k) ? @parents[node][k] : get_kth_ancestor(@parents[node].last, k + 1 - @parents[node].size)
  rescue => e
    -1
  end


end

# Your TreeAncestor object will be instantiated and called as such:
# obj = TreeAncestor.new(n, parent)
# param_1 = obj.get_kth_ancestor(node, k)

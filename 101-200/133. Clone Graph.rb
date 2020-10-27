# Definition for a Node.
# class Node
#     attr_accessor :val, :neighbors
#     def initialize(val = 0, neighbors = nil)
#		  @val = val
#		  neighbors = [] if neighbors.nil?
#         @neighbors = neighbors
#     end
# end

def build(node)
  return @nodes[node.val] if @nodes[node.val]
  @nodes[node.val] = Node.new(node.val)
  node.neighbors&.each do |neighbor|
    @nodes[node.val].neighbors << build(neighbor)
  end
  @nodes[node.val]
end

# @param {Node} node
# @return {Node}
def cloneGraph(node)
  return nil if node.nil?
  @nodes = []
  build(node)
  @nodes[1]
end

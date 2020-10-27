# Definition for Node.
# class Node
#     attr_accessor :val, :next, :random
#     def initialize(val = 0)
#         @val = val
#		  @next = nil
#		  @random = nil
#     end
# end

def build(node)
  return @nodes[node] if @nodes[node]
  @nodes[node] = Node.new(node.val)
  @nodes[node].next = build(node.next) if node.next
  @nodes[node].random = build(node.random) if node.random
  @nodes[node]
end

# @param {Node} node
# @return {Node}
def copyRandomList(head)
  return nil if head.nil?
  @nodes = {}
  build(head)
  @nodes[head]
end

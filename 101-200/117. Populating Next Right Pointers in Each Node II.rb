# Definition for a Node.
# class Node
#     attr_accessor :val, :left, :right, :next
#     def initialize(val)
#         @val = val
#         @left, @right, @next = nil, nil, nil
#     end
# end

def preorder(node, level = 0)
  return if node.nil?
  @prev[level].next = node if @prev[level]
  @prev[level] = node
  preorder(node.left, level + 1)
  preorder(node.right, level + 1)
end

# @param {Node} root
# @return {Node}
def connect(root)
  @prev = []
  preorder(root)
  root
end

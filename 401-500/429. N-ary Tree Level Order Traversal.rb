# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

def preorder(root, level = 0)
  return if root.nil?
  @array[level] ||= []
  @array[level] << root.val
  root.children.each { |child| preorder(child, level+1) }
end

# @param {Node} root
# @return {List[List[int]]}
def levelOrder(root)
  @array = []
  preorder(root)
  @array
end

# Definition for a Node.
# class Node
#     attr_accessor :val, :children
#     def initialize(val)
#         @val = val
#         @children = []
#     end
# end

# @param {Node} root
# @return {int}
def maxDepth(root)
  return 0 if root.nil?
  root.children.empty? ? 1 : 1 + root.children.map { |child| maxDepth(child) }.max
end

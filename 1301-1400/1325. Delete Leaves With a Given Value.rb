# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @param {Integer} target
# @return {TreeNode}
def remove_leaf_nodes(root, target)
  return nil if root.nil?
  root.left = remove_leaf_nodes(root.left, target)
  root.right = remove_leaf_nodes(root.right, target)
  root.left.nil? && root.right.nil? && root.val == target ? nil : root
end

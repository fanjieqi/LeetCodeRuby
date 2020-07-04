# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} preorder
# @return {TreeNode}
def bst_from_preorder(preorder)
  return nil if preorder.size.zero?
  root = TreeNode.new(preorder.shift)
  i = preorder.index { |val| val > root.val } || preorder.size
  root.left = bst_from_preorder(preorder[0..i-1]) if i > 0
  root.right = bst_from_preorder(preorder[i..-1])
  root
end

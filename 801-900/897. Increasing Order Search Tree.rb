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
# @return {TreeNode}
def increasing_bst(root)
  return nil if root.nil?
  while root.left
    tmp = root.left
    root.left = tmp.right
    tmp.right = root
    root = tmp
  end
  root.right = increasing_bst(root.right) if root.right
  root
end

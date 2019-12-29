# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer[]}
def inorder_traversal(root)
  return [] if root.nil?
  return [root.val] if root.left.nil? && root.right.nil?
  ans = []
  ans += inorder_traversal(root.left)
  ans << root.val
  ans += inorder_traversal(root.right)
  ans
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def flip_equiv(root1, root2)
  return true if root1.nil? && root2.nil?
  root1&.val == root2&.val && (flip_equiv(root1.left, root2.left) && flip_equiv(root1.right, root2.right) || flip_equiv(root1.left, root2.right) && flip_equiv(root1.right, root2.left))
end

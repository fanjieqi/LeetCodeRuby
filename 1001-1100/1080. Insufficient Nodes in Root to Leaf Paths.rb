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
# @param {Integer} limit
# @return {TreeNode}
def sufficient_subset(root, limit)
  return nil if root.nil?
  if root.left.nil? && root.right.nil?
    root.val < limit ? nil : root
  else
    root.left = sufficient_subset(root.left, limit - root.val)
    root.right = sufficient_subset(root.right, limit - root.val)
    (root.left || root.right) ? root :nil
  end
end

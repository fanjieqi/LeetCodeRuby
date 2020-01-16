# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def sum_of_left_leaves(root, flag = false)
  return 0 if root.nil?
  sum_of_left_leaves(root.left, true) + (flag && root.left.nil? && root.right.nil? ? root.val : 0) + sum_of_left_leaves(root.right, false)
end

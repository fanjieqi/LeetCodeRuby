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
# @param {Integer} l
# @param {Integer} r
# @return {Integer}
def range_sum_bst(root, l, r)
  return 0 if root.nil?
  if root.val < l
    range_sum_bst(root.right, l, r)
  elsif root.val > r
    range_sum_bst(root.left, l, r)
  else
    root.val + range_sum_bst(root.left, l, r) + range_sum_bst(root.right, l, r)
  end
end

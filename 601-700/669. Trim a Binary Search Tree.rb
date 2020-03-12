# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} l
# @param {Integer} r
# @return {TreeNode}
def trim_bst(root, l, r)
  return nil if root.nil?
  root.left = trim_bst(root.left, l, r)
  root.right = trim_bst(root.right, l, r)
  if root.val.between?(l, r)
    root
  elsif root.left.nil?
    root.right
  elsif root.right.nil?
    root.left
  else
    left = left.right while left.right
    left.right = root.right
    root.left
  end
end

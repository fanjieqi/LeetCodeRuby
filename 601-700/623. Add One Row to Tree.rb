# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} v
# @param {Integer} d
# @return {TreeNode}
def add_one_row(root, v, d)
  if d == 1
    node = TreeNode.new(v)
    node.left = root
    return node
  elsif d == 2
    left = TreeNode.new(v)
    right = TreeNode.new(v)
    left.left = root.left
    right.right = root.right
    root.left = left
    root.right = right
  else
    add_one_row(root.left, v, d - 1) if root.left
    add_one_row(root.right, v, d - 1) if root.right
  end
  root
end

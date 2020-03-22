# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} val
# @return {TreeNode}
def insert_into_bst(root, val)
  if root.nil?
    root = TreeNode.new(val)
  elsif val < root.val
    root.left = insert_into_bst(root.left, val)
  elsif val > root.val
    root.right = insert_into_bst(root.right, val)
  end
  root
end

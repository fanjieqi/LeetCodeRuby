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
def search_bst(root, val)
  if root.nil?
    root
  elsif root.val == val
    root
  elsif val < root.val
    search_bst(root.left, val)
  else
    search_bst(root.right, val)
  end
end

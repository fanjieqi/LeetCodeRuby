# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} preorder
# @param {Integer[]} inorder
# @return {TreeNode}
def build_tree(preorder, inorder)
  root = TreeNode.new(preorder[0])
  l = inorder.index(preorder[0])
  root.left = build_tree(preorder[1..l], inorder[0..l-1]) if l && (l > 0)
  root.right = build_tree(preorder[l+1..-1], inorder[l+1..-1]) if l && (l < preorder.length - 1)
  root
end

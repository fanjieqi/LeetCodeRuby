# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} inorder
# @param {Integer[]} postorder
# @return {TreeNode}
def build_tree(inorder, postorder)
  root = TreeNode.new(postorder[-1])
  l = inorder.index(postorder[-1])
  root.left = build_tree(inorder[0..l-1], postorder[0..l-1]) if l && (l > 0)
  root.right = build_tree(inorder[l+1..-1], postorder[l..-2]) if l && (l < postorder.length - 1) 
  root
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root, i)
  return if root.nil?
  @hash[i] = true
  preorder(root.left, i * 2)
  preorder(root.right, i * 2 + 1)
end

# @param {TreeNode} root
# @return {Boolean}
def is_complete_tree(root)
  @hash = {}
  preorder(root, 1)
  @hash.size == @hash.keys.max
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root, level = 0)
  return if root.nil? || !@ans
  return @ans = false if (level.even? && (root.val.even? || @array[level] && @array[level] >= root.val) || level.odd? && (root.val.odd? || @array[level] && @array[level] <= root.val))
  @array[level] = root.val
  preorder(root.left, level+1)
  preorder(root.right, level+1)
end

# @param {TreeNode} root
# @return {Boolean}
def is_even_odd_tree(root)
  @array, @ans = [], true
  preorder(root)
  @ans
end

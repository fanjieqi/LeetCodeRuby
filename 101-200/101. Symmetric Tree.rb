# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def is_sub(left, right)
  return left == right if left.nil? || right.nil?
  left.val == right.val && is_sub(left.left, right.right) && is_sub(left.right, right.left)
end

# @param {TreeNode} root
# @return {Boolean}
def is_symmetric(root)
  return true if root.nil?
  is_sub(root.left, root.right)
end

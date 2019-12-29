# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def max_depth(root)
  return 0 if root.nil?
  [max_depth(root.left), max_depth(root.right)].max + 1
end


# @param {TreeNode} root
# @return {Boolean}
def is_balanced(root)
  return true if root.nil?
  (max_depth(root.left) - max_depth(root.right)).abs <= 1 && is_balanced(root.left) && is_balanced(root.right)
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def depth(root, val)
  root&.val != val ? 0 : [depth(root.left, val), depth(root.right, val)].max+1
end

# @param {TreeNode} root
# @return {Integer}
def longest_univalue_path(root)
  return 0 if root.nil?
  [depth(root.left, root.val) + depth(root.right, root.val), longest_univalue_path(root.left), longest_univalue_path(root.right)].max
end

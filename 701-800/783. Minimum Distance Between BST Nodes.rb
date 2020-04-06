# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def inorder(root)
  root.nil? ? [] : inorder(root.left) + [root.val] + inorder(root.right)
end

# @param {TreeNode} root
# @return {Integer}
def min_diff_in_bst(root)
  array = inorder(root)
  (1..array.size-1).map { |i| array[i] - array[i-1]}.min
end

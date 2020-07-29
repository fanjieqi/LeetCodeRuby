# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root, level = 1)
  return if root.nil?
  @sum[level] = @sum[level].to_i + root.val
  preorder(root.left, level + 1)
  preorder(root.right, level + 1)
end

# @param {TreeNode} root
# @return {Integer}
def max_level_sum(root)
  @sum = []
  preorder(root)
  max = @sum[1..-1].max
  (0..@sum.size-1).find { |level| @sum[level] == max } 
end

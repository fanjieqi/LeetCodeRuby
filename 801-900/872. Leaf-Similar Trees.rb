# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, result)
  return if root.nil?
  result << root.val if root.left.nil? && root.right.nil?
  dfs(root.left, result)
  dfs(root.right, result)
end

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Boolean}
def leaf_similar(root1, root2)
  @result1, @result2 = [], []
  dfs(root1, @result1)
  dfs(root2, @result2)
  @result1 == @result2
end

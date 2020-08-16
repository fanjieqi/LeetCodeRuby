# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, depth)
  return if root.nil?
  @f[depth] = @f[depth].to_i + root.val
  dfs(root.left, depth + 1) if root.left
  dfs(root.right, depth + 1) if root.right
end

# @param {TreeNode} root
# @return {Integer}
def deepest_leaves_sum(root)
  @f = []
  dfs(root, 0)
  @f[-1]
end

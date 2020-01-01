# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(ans, node, depth)
  return if node.nil?
  dfs(ans, node.right, depth + 1)
  ans[depth] ||= node.val
  dfs(ans, node.left, depth + 1)
end

# @param {TreeNode} root
# @return {Integer[]}
def right_side_view(root)
  return [] if root.nil?
  ans = []
  dfs(ans, root, 0)
  ans
end

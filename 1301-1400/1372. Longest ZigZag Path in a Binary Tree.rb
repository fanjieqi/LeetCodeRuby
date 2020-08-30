# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, is_left, depth = 0)
  return if root.nil?
  @depth = depth if depth > @depth
  dfs(root.left, true, is_left ? 1 : depth + 1) if root.left
  dfs(root.right, false, is_left ? depth + 1 : 1) if root.right
end

# @param {TreeNode} root
# @return {Integer}
def longest_zig_zag(root)
  @depth = 0
  dfs(root, true)
  dfs(root, false)
  @depth
end

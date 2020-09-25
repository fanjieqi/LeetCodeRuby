# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
def dfs(node ,max)
  return if node.nil?
  if node.val >= max
    @count += 1
    max = node.val
  end
  dfs(node.left, max)
  dfs(node.right, max)
end

# @param {TreeNode} root
# @return {Integer}
def good_nodes(root)
  @count = 0
  dfs(root, root.val)
  @count
end

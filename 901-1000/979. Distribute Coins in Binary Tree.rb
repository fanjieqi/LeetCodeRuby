# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
def dfs(root)
  return 0 if root.nil?
  left = dfs(root.left)
  right = dfs(root.right)
  @res += (left.abs) + (right.abs)
  root.val + left + right - 1
end

# @param {TreeNode} root
# @return {Integer}
def distribute_coins(root, pre = nil)
  @res = 0
  dfs(root)
  @res
end

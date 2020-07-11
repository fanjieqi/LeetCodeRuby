# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, k)
  return if root.nil?
  k += root.val
  if root.left.nil? && root.right.nil?
    @ans += k
  else
    dfs(root.left, k << 1)
    dfs(root.right, k << 1)
  end
end

# @param {TreeNode} root
# @return {Integer}
def sum_root_to_leaf(root)
  @ans = 0
  dfs(root, 0)
  @ans
end

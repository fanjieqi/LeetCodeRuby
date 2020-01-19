# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(root, sum, flag)
  return if root.nil?
  @count += 1 if root.val == sum
  dfs(root.left, sum - root.val, false)
  dfs(root.right, sum - root.val, false)
  if flag
    dfs(root.left, sum, true)
    dfs(root.right, sum, true)
  end
end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer}
def path_sum(root, sum)
  @count = 0
  dfs(root, sum, true)
  @count
end

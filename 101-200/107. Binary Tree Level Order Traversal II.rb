# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(result, root, n)
  return if root.nil?
  result[n] ||= []
  result[n] << root.val
  dfs(result, root.left, n+1)
  dfs(result, root.right, n+1)
end


# @param {TreeNode} root
# @return {Integer[][]}
def level_order_bottom(root)
  result = []
  dfs(result, root, 0)
  result.reverse
end

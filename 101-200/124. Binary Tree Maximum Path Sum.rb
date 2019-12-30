# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(max, root)
  return 0 if root.nil?
  left = [dfs(max, root.left), 0].max
  right = [dfs(max, root.right), 0].max
  max[0] = [max[0], root.val + left + right].max
  root.val + [left, right].max
end

# @param {TreeNode} root
# @return {Integer}
def max_path_sum(root)
  max = [root.val.to_i]
  dfs(max, root)
  max[0]
end

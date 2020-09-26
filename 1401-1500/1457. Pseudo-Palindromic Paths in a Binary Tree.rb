# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(node, hash)
  hash[node.val] = 1 - hash[node.val].to_i
  if node.left.nil? && node.right.nil?
    @count += 1 if hash.values.sum <= 1
  else
    dfs(node.left, hash) if node.left
    dfs(node.right, hash) if node.right
  end
  hash[node.val] = 1 - hash[node.val].to_i
end

# @param {TreeNode} root
# @return {Integer}
def pseudo_palindromic_paths(root)
  @count = 0
  dfs(root, {})
  @count
end

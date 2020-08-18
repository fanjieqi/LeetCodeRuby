# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(node, even_grandparent = false)
  return if node.nil?
  @sum += node.left&.val.to_i + node.right&.val.to_i if even_grandparent
  dfs(node.left, node.val.even?)
  dfs(node.right, node.val.even?)
end

# @param {TreeNode} root
# @return {Integer}
def sum_even_grandparent(root)
  @sum = 0
  dfs(root)
  @sum
end

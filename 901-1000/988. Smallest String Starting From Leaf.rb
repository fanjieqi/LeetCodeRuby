# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

BASIC = 'a'.ord

def dfs(root, str, l)
  return if root.nil?
  tmp = (BASIC + root.val).chr + str
  @hash[l] = tmp if root.left.nil? && root.right.nil? && (@hash[l].nil? || tmp < @hash[l])
  dfs(root.left, tmp, l+1)
  dfs(root.right, tmp, l+1)
end

# @param {TreeNode} root
# @return {String}
def smallest_from_leaf(root)
  @hash = {}
  dfs(root, "", 1)
  @hash.values.min
end

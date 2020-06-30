# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
def dfs(root, x, y)
  return if root.nil?
  @hash[x] ||= []
  @hash[x] << [x, y, root.val]
  dfs(root.left, x-1, y+1)
  dfs(root.right, x+1, y+1)
end

# @param {TreeNode} root
# @return {Integer[][]}
def vertical_traversal(root)
  @hash = {}
  dfs(root, 0, 0)
  @hash.transform_values { |values| values.sort.map(&:last) }.sort_by(&:first).map(&:last)
end

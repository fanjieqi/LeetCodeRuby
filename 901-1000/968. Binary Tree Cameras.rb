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
  return 2 if root.nil?
  l, r = dfs(root.left), dfs(root.right)
  if l == 0 || r == 0
    @res += 1
    1
  elsif l == 1 || r == 1
    2
  else
    0
  end
end

# @param {TreeNode} root
# @return {Integer}
def min_camera_cover(root)
  @res = 0
  (dfs(root) == 0 ? 1 : 0) + @res
end

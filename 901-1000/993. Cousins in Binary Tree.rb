# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, depth)
  return if root.nil? || @depth_x && @depth_y
  @depth_x, @parent_x = depth + 1, root if root.left&.val == @x || root.right&.val == @x
  @depth_y, @parent_y = depth + 1, root if root.left&.val == @y || root.right&.val == @y
  dfs(root.left, depth+1)
  dfs(root.right, depth+1)
end

# @param {TreeNode} root
# @param {Integer} x
# @param {Integer} y
# @return {Boolean}
def is_cousins(root, x, y)
  @x, @y = x, y
  @depth_x, @depth_y = nil, nil
  @parent_x, @parent_y = nil, nil
  dfs(root, 0)
  @depth_x == @depth_y && @parent_x != @parent_y
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root)
  return 0 if root.nil?
  @red = root if root.val == @x
  @parent[root.left.val] = root.val if root.left
  @parent[root.right.val] = root.val if root.right
  @count[root.val] = preorder(root.left) + preorder(root.right) + 1
end

# @param {TreeNode} root
# @param {Integer} n
# @param {Integer} x
# @return {Boolean}
def btree_game_winning_move(root, n, x)
  @count, @parent, @x, @red = {}, {}, x, nil
  preorder(root)
  x != root.val && @count[root.val] - @count[x] > @count[x] || \
  x != root.val && @red.left && (@red.right.nil? || @count[root.val] - @count[@red.left.val] < @count[@red.left.val]+1) || \
  x != root.val && @red.right && (@red.left.nil? || @count[root.val] - @count[@red.right.val] < @count[@red.right.val]+1) || \
  x == root.val && @red.left && (@red.right.nil? || @count[@red.left.val] > @count[@red.right.val]+1) || \
  x == root.val && @red.right && (@red.left.nil? || @count[@red.right.val] > @count[@red.left.val]+1)
end

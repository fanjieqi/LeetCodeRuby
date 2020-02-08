# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def depth(root)
  return 0 if root.nil?
  left, right = depth(root.left), depth(root.right)
  @ans = left + right if left + right > @ans
  [left, right].max + 1
end

# @param {TreeNode} root
# @return {Integer}
def diameter_of_binary_tree(root)
  @ans = 0
  depth(root)
  @ans
end

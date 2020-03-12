# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def inorder(root)
  return if root.nil?
  inorder(root.left)
  @hash[root.val] = true
  inorder(root.right)
end

# @param {TreeNode} root
# @return {Integer}
def find_second_minimum_value(root)
  @hash = {}
  inorder(root)
  @hash.keys.sort[1] || -1
end

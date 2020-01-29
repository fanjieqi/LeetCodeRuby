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
  @hash[root.val] ||= 0
  @hash[root.val] += 1
  inorder(root.right)
end

# @param {TreeNode} root
# @return {Integer[]}
def find_mode(root)
  @hash = {}
  inorder(root)
  max = @hash.values.max
  @hash.select{|k, v| v==max }.map(&:first)
end

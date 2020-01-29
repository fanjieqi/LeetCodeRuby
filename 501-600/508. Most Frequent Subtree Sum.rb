# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def preorder(root)
  return 0 if root.nil?
  left = preorder(root.left)
  right = preorder(root.right)
  root.val += left + right
  @hash[root.val] ||= 0
  @hash[root.val] += 1
  root.val
end

# @param {TreeNode} root
# @return {Integer[]}
def find_frequent_tree_sum(root)
  @hash = {}
  preorder(root)
  max = @hash.values.max
  @hash.select{|k, v| v==max }.map(&:first)
end

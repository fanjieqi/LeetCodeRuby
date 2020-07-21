# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root, flag = true)
  return nil if root.nil?
  @ans << root if @hash[root.val].nil? && flag
  root.left = preorder(root.left, @hash[root.val])
  root.right = preorder(root.right, @hash[root.val])
  @hash[root.val].nil? ? root : nil
end

# @param {TreeNode} root
# @param {Integer[]} to_delete
# @return {TreeNode[]}
def del_nodes(root, to_delete)
  @hash = to_delete.inject({}) { |tmp, val| tmp.merge(val => true) }
  @ans = []
  preorder(root)
  @ans
end

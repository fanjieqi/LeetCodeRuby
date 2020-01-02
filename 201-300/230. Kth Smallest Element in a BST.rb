# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def count_nodes(root)
  return 0 if root.nil?
  1 + count_nodes(root.left) + count_nodes(root.right)
end

# @param {TreeNode} root
# @param {Integer} k
# @return {Integer}
def kth_smallest(root, k)
  return nil if root.nil?
  return root.val if k == 1 && root.left.nil? && root.right.nil?
  left_count = count_nodes(root.left)
  return kth_smallest(root.left, k) if k <= left_count
  return root.val if k == left_count + 1
  kth_smallest(root.right, k - left_count - 1)
end

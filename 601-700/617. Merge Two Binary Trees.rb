# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} t1
# @param {TreeNode} t2
# @return {TreeNode}
def merge_trees(t1, t2)
  return t1 || t2 if t1.nil? || t2.nil?
  t1.val += t2.val
  t1.left = merge_trees(t1.left, t2.left)
  t1.right = merge_trees(t1.right, t2.right)
  t1
end

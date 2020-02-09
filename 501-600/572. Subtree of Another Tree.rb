# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} s
# @param {TreeNode} t
# @return {Boolean}
def is_subtree(s, t)
  return s.nil? && t.nil? if s.nil? || t.nil?
  s.val == t.val && s.left&.val == t.left&.val && s.right&.val == t.right&.val && (is_subtree(s.left, t.left) && is_subtree(s.right, t.right)) ||
  is_subtree(s.right, t) || is_subtree(s.left, t)
end

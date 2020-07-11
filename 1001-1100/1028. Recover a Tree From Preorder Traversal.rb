# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {String} s
# @return {TreeNode}
def recover_from_preorder(s, depth = 1)
  return nil if s.nil? || s == ''
  val = s[/^\d+/]
  root = TreeNode.new(val.to_i)
  i = s.index(/(?<=\d)[\-]{#{depth}}(?=\d)/) || s.size
  j = s.index(/(?<=\d)[\-]{#{depth}}(?=\d)/, i+depth) || s.size
  root.left = recover_from_preorder(s[i+depth..j-1], depth+1)
  root.right = recover_from_preorder(s[j+depth..-1], depth+1)
  root
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {Integer[]} pre
# @param {Integer[]} post
# @return {TreeNode}
def construct_from_pre_post(pre, post)
  return nil if pre.empty? && post.empty?
  root, _ = TreeNode.new(pre.shift), post.pop
  return root if pre.empty? && post.empty?
  i = post.index(pre[0])
  root.left = construct_from_pre_post(pre[0..i], post[0..i])
  root.right = construct_from_pre_post(pre[i+1..-1], post[i+1..-1])
  root
end

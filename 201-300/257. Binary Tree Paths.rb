# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {String[]}
def binary_tree_paths(root)
  return [] if root.nil?
  return [root.val.to_s] if root.left.nil? && root.right.nil?
  lefts = binary_tree_paths(root.left)
  rights = binary_tree_paths(root.right)
  lefts.map {|s| root.val.to_s + "->" + s } + rights.map {|s| root.val.to_s + "->" + s}
end

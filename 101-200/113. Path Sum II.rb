# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} sum
# @return {Integer[][]}
def path_sum(root, sum)
  return [] if root.nil?
  return [[root.val]] if root.val == sum && root.left.nil? && root.right.nil?
  ans = []
  left = path_sum(root.left, sum - root.val)
  ans += left.map {|ele| ele.unshift(root.val) }  if left.length > 0
  right = path_sum(root.right, sum - root.val)
  ans += right.map {|ele| ele.unshift(root.val) }  if right.length > 0
  ans
end

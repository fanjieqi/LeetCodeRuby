# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
# @param {TreeNode} root
# @return {Integer}
def max_ancestor_diff(root, array = [])
  if root.nil?
    array[-1] - array[0]
  else
    i = array.bsearch_index { |ele| ele >= root.val } || array.size
    array.insert(i, root.val)
    left = max_ancestor_diff(root.left, array)
    right = max_ancestor_diff(root.right, array)
    array.delete_at(i)
    [left, right].max
  end
end

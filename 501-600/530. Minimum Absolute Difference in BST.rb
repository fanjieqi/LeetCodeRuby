# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def inorder(root)
  return if root.nil?
  inorder(root.left)
  @array << root.val
  inorder(root.right)
end

# @param {TreeNode} root
# @return {Integer}
def get_minimum_difference(root)
  @array = []
  inorder(root)
  (1..@array.size-1).map{|i| @array[i] - @array[i-1]}.min
end

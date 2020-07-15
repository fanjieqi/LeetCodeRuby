# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def inorder(root)
  return if root.nil?
  inorder(root.left)
  @array << root
  inorder(root.right)
end
# @param {TreeNode} root
# @return {TreeNode}
def bst_to_gst(root)
  @array = []
  inorder(root)
  sum = @array.inject(0) { |tmp, node| tmp += node.val }
  @array.each do |node|
    tmp = node.val
    node.val = sum
    sum -= tmp
  end
  root
end

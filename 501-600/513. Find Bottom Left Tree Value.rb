# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def inorder(root, depth=0)
  return if root.nil?
  inorder(root.left, depth+1)
  @arr[depth] ||= root.val
  inorder(root.right, depth+1)
end

# @param {TreeNode} root
# @return {Integer}
def find_bottom_left_value(root)
  @arr = []
  inorder(root)
  @arr.last
end

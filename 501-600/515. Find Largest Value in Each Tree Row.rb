# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def preorder(root, depth=0)
  return if root.nil?
  @arr[depth] = root.val if @arr[depth].nil? || root.val > @arr[depth]
  preorder(root.left, depth+1)
  preorder(root.right, depth+1)
end

# @param {TreeNode} root
# @return {Integer[]}
def largest_values(root)
  @arr = []
  preorder(root)
  @arr
end

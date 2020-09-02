# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root)
  return if root.nil?
  preorder(root.left)
  @array << root.val
  preorder(root.right)
end

def build(array)
  return nil if array.empty?
  mid = array.size / 2
  node = TreeNode.new(array[mid])
  node.left = build(array[0..mid-1]) if mid > 0
  node.right = build(array[mid+1..-1])
  node
end

# @param {TreeNode} root
# @return {TreeNode}
def balance_bst(root)
  @array = []
  preorder(root)
  build(@array)
end

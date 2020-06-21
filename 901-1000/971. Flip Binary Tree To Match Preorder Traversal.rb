# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder_flipped(root, voyage)
  return if root.nil?
  return @flag = false if root.val != voyage[0]
  voyage.shift
  if root.left && root.right.nil?
    preorder_flipped(root.left, voyage)
  elsif root.left.nil? && root.right
    preorder_flipped(root.right, voyage)
  elsif root.left&.val == voyage[0]
    preorder_flipped(root.left, voyage)
    preorder_flipped(root.right, voyage)
  elsif root.right&.val == voyage[0]
    @array << root.val
    preorder_flipped(root.right, voyage)
    preorder_flipped(root.left, voyage)
  elsif root.left || root.right
    @flag = false
  end
end

# @param {TreeNode} root
# @param {Integer[]} voyage
# @return {Integer[]}
def flip_match_voyage(root, voyage)
  @array, @flag = [], true
  preorder_flipped(root, voyage)
  @flag ? @array :[-1]
end

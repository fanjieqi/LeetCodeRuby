# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
def preorder1(root)
  return if root.nil?
  preorder1(root.left)
  @array1 << root.val
  preorder1(root.right)
end

def preorder2(root)
  return if root.nil?
  preorder2(root.left)
  @array2 << root.val
  preorder2(root.right)
end

# @param {TreeNode} root1
# @param {TreeNode} root2
# @return {Integer[]}
def get_all_elements(root1, root2)
  @array1, @array2 = [], []
  preorder1(root1)
  preorder2(root2)
  array = []
  while !@array1.empty? || !@array2.empty?
    return array + @array2 if @array1.empty?
    return array + @array1 if @array2.empty?
    array << @array1.shift while !@array1.empty? && !@array2.empty? && @array1[0] <= @array2[0]
    array << @array2.shift while !@array1.empty? && !@array2.empty? && @array2[0] <= @array1[0]
  end
  array
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def reverseorder(root)
  return 0 if root.nil?
  reverseorder(root.right)
  @array << root
  reverseorder(root.left)
end

# @param {TreeNode} root
# @return {TreeNode}
def convert_bst(root)
  @array = []
  reverseorder(root)
  (1..@array.length-1).each {|i| @array[i].val += @array[i-1].val}
  root
end

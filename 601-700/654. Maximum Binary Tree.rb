# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {Integer[]} nums
# @return {TreeNode}
def construct_maximum_binary_tree(nums)
  root = TreeNode.new(nums.max)
  i = nums.index(root.val) 
  root.left = construct_maximum_binary_tree(nums[0..i-1]) if i > 0
  root.right = construct_maximum_binary_tree(nums[i+1..-1]) if i < nums.size - 1
  root
end

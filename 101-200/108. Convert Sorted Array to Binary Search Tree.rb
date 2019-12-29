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
def sorted_array_to_bst(nums)
  return nil if nums.length == 0
  return TreeNode.new(nums[0]) if nums.length == 1
  mid = nums.length / 2
  root = TreeNode.new(nums[mid])
  root.left = sorted_array_to_bst(nums[0..mid - 1]) if mid > 0
  root.right = sorted_array_to_bst(nums[mid+1..-1]) if mid < nums.length - 1
  root
end

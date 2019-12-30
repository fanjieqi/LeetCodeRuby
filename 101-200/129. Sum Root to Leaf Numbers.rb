# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def count(nums)
  nums.reverse.map.with_index {|num, i| num * 10**i }.sum
end

def dfs(sum, nums, root)
  return if root.nil?
  return sum[0] += count(nums) if root.left.nil? && root.right.nil?
  dfs(sum, nums + [root.left.val], root.left) if root.left
  dfs(sum, nums + [root.right.val], root.right) if root.right
end

# @param {TreeNode} root
# @return {Integer}
def sum_numbers(root)
  sum = [0]
  path = [root&.val.to_i]
  dfs(sum, path, root)
  sum[0]
end

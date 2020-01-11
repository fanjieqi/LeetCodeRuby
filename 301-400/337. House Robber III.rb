# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def rob(root)
  return 0 if root.nil?
  @hash ||= {}
  return @hash[root] if @hash[root]
  result = [
    rob(root.left) + rob(root.right),
    rob(root.left) + rob(root.right&.left) + rob(root.right&.right),
    rob(root.left&.left) + rob(root.left&.right) + rob(root.right),
    root.val + rob(root.left&.left) + rob(root.left&.right) + rob(root.right&.left) + rob(root.right&.right) 
  ].max
  @hash[root] = result
  result
end

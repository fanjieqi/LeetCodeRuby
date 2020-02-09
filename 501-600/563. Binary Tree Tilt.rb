# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def postorder(root)
  return 0 if root.nil?
  left = postorder(root.left)
  right = postorder(root.right)
  @ans += (left - right).abs
  left + right + root.val
end

# @param {TreeNode} root
# @return {Integer}
def find_tilt(root)
  @ans = 0
  postorder(root)
  @ans
end

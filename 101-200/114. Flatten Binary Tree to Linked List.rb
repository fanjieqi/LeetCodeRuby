# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find_right(root)
  tmp = root
  tmp = tmp.right while tmp.right
  tmp
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def flatten(root)
  return if root.nil?
  right = root.right
  if root.left
    left_right = find_right(root.left)

    root.right = root.left
    root.left = nil

    left_right.right = right
  end

  flatten(root.right)
end

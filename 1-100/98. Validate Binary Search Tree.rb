# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find_max(root)
  root = root.right while root.right
  root
end

def find_min(root)
  root = root.left while root.left
  root
end

# @param {TreeNode} root
# @return {Boolean}
def is_valid_bst(root)
  return true if root.nil?
  return false if root.left && (find_max(root.left).val >= root.val || !is_valid_bst(root.left))
  return false if root.right && (find_min(root.right).val <= root.val  || !is_valid_bst(root.right))
  true
end

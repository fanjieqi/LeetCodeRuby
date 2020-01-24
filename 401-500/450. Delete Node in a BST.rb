# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @param {Integer} key
# @return {TreeNode}
def delete_node(root, key)
  return root if root.nil?
  if key == root.val
    if root.left
      left = root.left
      left = left.right while left.right
      left.right = root.right
      root.right = nil
      root.left
    elsif root.right
      right = root.right
      right = right.left while right.left
      right.left = root.left
      root.left = nil
      root.right
    else
      nil
    end
  elsif key > root.val
    root.right = delete_node(root.right, key)
    root
  elsif key < root.val
    root.left = delete_node(root.left, key)
    root
  end
end

# node = TreeNode.new(1)
# node = delete_node(node, 1)

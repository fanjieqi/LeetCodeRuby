# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find(node, k)
  return [] if node.nil?
  return [node] if node == k
  left = find(node.left, k)
  return [node] + left if left && left.length > 0
  right = find(node.right, k)
  return [node] + right if right && right.length > 0
end

# @param {TreeNode} root
# @param {TreeNode} p
# @param {TreeNode} q
# @return {TreeNode}
def lowest_common_ancestor(root, p1, q)
  return nil if root.nil?
  path_p = find(root, p1)
  path_q = find(root, q)
  i = 0
  i += 1 while (i < path_p.length - 1) && (i < path_q.length - 1) && (path_p[i] == path_q[i])
  path_p[i] == path_q[i] ? path_p[i] : path_p[i-1]
end

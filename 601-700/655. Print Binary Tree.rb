# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def depth(root)
  root.nil? ? 0 : [depth(root.left), depth(root.right)].max + 1
end

def print_line(root, depth, l, r)
  mid = (l + r) / 2
  @array[depth][mid] = root.val.to_s
  print_line(root.left, depth + 1, l, mid - 1) if root.left
  print_line(root.right, depth + 1, mid + 1, r) if root.right
end

# @param {TreeNode} root
# @return {String[][]}
def print_tree(root)
  return [] if root.nil?
  m = depth(root)
  n = 0
  m.times { n = (n * 2 + 1) }
  @array = m.times.map { n.times.map {""} }
  print_line(root, 0, 0, n)
  @array
end

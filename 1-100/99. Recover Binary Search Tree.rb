# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find_max(root, val)
  return nil if root.nil?
  max = [root.val, val].max
  l_max = find_max(root.left, max)
  r_max = find_max(root.right, max)
  if l_max && r_max
    l_max.val > r_max.val ? l_max : r_max
  else
    l_max || r_max || (root.val > val ? root : nil)
  end
end

def find_min(root, val)
  return nil if root.nil?
  min = [root.val, val].min
  l_min = find_min(root.left, min)
  r_min = find_min(root.right, min)
  if l_min && r_min
    l_min.val < r_min.val ? l_min : r_min
  else
    l_min || r_min || (root.val < val ? root : nil)
  end
end

# @param {TreeNode} root
# @return {Void} Do not return anything, modify root in-place instead.
def recover_tree(root)
  return if root.nil?
  l_max = find_max(root.left, root.val)
  r_min = find_min(root.right, root.val)
  if l_max && r_min
    l_max.val, r_min.val = r_min.val, l_max.val
  elsif l_max
    l_max.val, root.val = root.val, l_max.val
  elsif r_min
    r_min.val, root.val = root.val, r_min.val
  else
    recover_tree(root.left)
    recover_tree(root.right)
  end
end

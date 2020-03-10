# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def find(root, val)
  if root.nil?
    nil
  elsif val < root.val
    find(root.left, val)
  elsif val > root.val 
    find(root.right, val)
  else
    root
  end
end

def inorder(root)
  root.nil? ? [] : (inorder(root.left) + [root] + inorder(root.right))
end

# @param {TreeNode} root
# @param {Integer} k
# @return {Boolean}
def find_target(root, k)
  inorder(root).any? { |node| 
    tmp = find(root, k - node.val) 
    tmp && tmp != node 
  }
end

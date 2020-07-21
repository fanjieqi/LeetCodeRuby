# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def preorder(root, ancestors = [], depth = 0)
  if root.left.nil? && root.right.nil?
    @ancestors[root] = ancestors + [root]
    @depth[depth] ||= []
    @depth[depth] << root
  end
  preorder(root.left, ancestors + [root], depth+1) if root.left
  preorder(root.right, ancestors + [root], depth+1) if root.right
end

# @param {TreeNode} root
# @return {TreeNode}
def lca_deepest_leaves(root)
  @ancestors, @depth = {}, []
  preorder(root)
  @depth[-1].map { |node| @ancestors[node] }.inject(&:&).last
end

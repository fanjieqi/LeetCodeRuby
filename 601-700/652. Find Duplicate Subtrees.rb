# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(root)
  return if root.nil?
  @stack << root
  @hash[root] = [root.val]
  @stack.each do |node|
    @hash[node] << root.left&.val
    @hash[node] << root.right&.val
  end
  dfs(root.left)
  dfs(root.right)
  @stack.pop
end

# @param {TreeNode} root
# @return {TreeNode[]}
def find_duplicate_subtrees(root)
  return [] if root.nil?
  @hash = {}
  @stack = []
  dfs(root)
  @hash.map { |node, tree| [node, tree.hash] }.group_by(&:last).values
       .map { |nodes| nodes.size > 1 ? nodes.first.first : nil}.compact
end

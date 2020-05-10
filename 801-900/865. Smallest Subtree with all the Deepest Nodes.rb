# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root, depth)
  @depth[root] = depth
  if root.left
    @father[root.left] = root
    dfs(root.left, depth + 1)
  end
  if root.right
    @father[root.right] = root
    dfs(root.right, depth + 1)
  end
end

# @param {TreeNode} root
# @return {TreeNode}
def subtree_with_all_deepest(root)
  @depth, @father = {}, {}
  dfs(root, 1)
  max = @depth.values.max
  hash = {}
  @depth.each { |node, depth| hash[node] = true if depth == max }
  loop do
    return hash.keys.first if hash.size == 1
    tmp = {}
    hash.each do |node, _|
      tmp[@father[node]] = true
    end
    hash = tmp
  end
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

def dfs(l, r)
  return [nil] if l > r
  return [TreeNode.new(l)] if l == r
  result = []
  (l..r).each do |i|
    lefts = i > l ? dfs(l, i-1) : [nil]
    root = TreeNode.new(i)
    rights = i < r ? dfs(i+1, r) : [nil]
    lefts.each do |left|
      rights.each do |right|
        mid = root.clone
        mid.left = left.clone
        mid.right = right.clone
        result << mid
      end
    end
  end
  result
end

# @param {Integer} n
# @return {TreeNode[]}
def generate_trees(n)
  return [] if n == 0
  dfs(1, n)
end

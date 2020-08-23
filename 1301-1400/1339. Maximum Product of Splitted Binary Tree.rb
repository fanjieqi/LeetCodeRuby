MOD = 10**9 + 7

# Definition for a binary tree node.
class TreeNode
    attr_accessor :val, :left, :right, :sum
    def initialize(val = 0, left = nil, right = nil)
        @val = val
        @left = left
        @right = right
    end
end

def sum(node)
  return 0 if node.nil?
  node.sum = node.val + sum(node.left) + sum(node.right)
end

def dfs(node)
  return if node.nil?
  tmp = node.sum * (@sum - node.sum)
  @max = tmp if tmp > @max
  dfs(node.left)
  dfs(node.right)
end

# @param {TreeNode} root
# @return {Integer}
def max_product(root)
  @sum, @max = sum(root), 0
  dfs(root)
  @max % MOD
end

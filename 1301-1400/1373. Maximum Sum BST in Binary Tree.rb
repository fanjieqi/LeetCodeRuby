# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end

def dfs(root)
  return [nil, nil, 0] if root.nil?
  lmax, lmin, lsum = dfs(root.left)
  rmax, rmin, rsum = dfs(root.right)

  if lsum == "" || rsum == "" || lmax && lmax >= root.val || rmin && rmin <= root.val
    [nil, nil, ""]
  else
    max = root.val
    max = rmax if rmax
    min = root.val
    min = lmin if lmin
    sum = lsum + rsum + root.val
    @max = sum if sum > @max
    [max, min, sum]
  end
end

# @param {TreeNode} root
# @return {Integer}
def max_sum_bst(root)
  @max = 0
  dfs(root)
  @max
end

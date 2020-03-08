# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Float[]}
def average_of_levels(root)
  sum = []
  queue = Queue.new
  queue << [0, root]
  while !queue.empty?
    level, node = queue.pop
    sum[level] ||= []
    sum[level] << node.val
    queue << [level+1, node.left] if node.left
    queue << [level+1, node.right] if node.right
  end
  sum.map {|arr| arr.sum / arr.size.to_f }
end

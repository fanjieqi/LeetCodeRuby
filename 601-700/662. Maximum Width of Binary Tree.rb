# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

# @param {TreeNode} root
# @return {Integer}
def width_of_binary_tree(root)
  max = 0
  queue = Queue.new
  queue << [root]
  while !queue.empty?
    current = queue.pop
    next if current.all?(&:nil?)
    current.shift while current.first.nil? && current.size > 0
    current.pop while current.last.nil? && current.size > 0
    max = current.size if current.size > max
    queue << current.map { |node| [node&.left, node&.right] }.flatten 
  end
  max
end

# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val = 0, left = nil, right = nil)
#         @val = val
#         @left = left
#         @right = right
#     end
# end
class CBTInserter

=begin
    :type root: TreeNode
=end
    def initialize(root)
      @root = root
      @queue = []
      build_queue(root)
    end

    def build_queue(root)
      @queue << root
      i = 0
      while i < @queue.size
        node = @queue[i]
        i += 1
        @queue << node.left if node.left
        @queue << node.right if node.right
        break if node.left.nil? || node.right.nil?
      end
      @queue.shift while @queue[0].left && @queue[0].right
    end

=begin
    :type v: Integer
    :rtype: Integer
=end
    def insert(v)
      node = TreeNode.new(v)
      @queue << node
      parent = @queue.first
      if parent.left.nil?
        parent.left = node
        parent.val
      elsif parent.right.nil?
        parent.right = node
        @queue.shift.val
      end
    end


=begin
    :rtype: TreeNode
=end
    def get_root()
      @root
    end


end

# Your CBTInserter object will be instantiated and called as such:
# obj = CBTInserter.new(root)
# param_1 = obj.insert(v)
# param_2 = obj.get_root()

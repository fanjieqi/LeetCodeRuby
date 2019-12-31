# Definition for a binary tree node.
# class TreeNode
#     attr_accessor :val, :left, :right
#     def initialize(val)
#         @val = val
#         @left, @right = nil, nil
#     end
# end

class BSTIterator

=begin
    :type root: TreeNode
=end
    def initialize(root)
      @root = root
      @queue = Queue.new
      build_queue(@root)
    end

    def build_queue(node)
      return nil if node.nil?
      build_queue(node.left)
      @queue << node
      build_queue(node.right)
    end


=begin
    @return the next smallest number
    :rtype: Integer
=end
    def next()
      @queue.pop.val
    end


=begin
    @return whether we have a next smallest number
    :rtype: Boolean
=end
    def has_next()
      !@queue.empty?
    end


end

# Your BSTIterator object will be instantiated and called as such:
# obj = BSTIterator.new(root)
# param_1 = obj.next()
# param_2 = obj.has_next()

# Definition for a binary tree node.
class TreeNode
  attr_accessor :val, :left, :right
  def initialize(val = 0, left = nil, right = nil)
      @val = val
      @left = left
      @right = right
  end

  def set_val(val)
    @val = val
    @left.set_val(val * 2 + 1) if @left
    @right.set_val(val * 2 + 2) if @right
  end

  def find(val)
    @val == val || val >= (@val*2+1) && @left&.find(val) || val >= (@val*2+2) && @right&.find(val) || false
  end
end

class FindElements

=begin
    :type root: TreeNode
=end
    def initialize(root, val = 0)
      @root = root
      @root.set_val(0)
    end


=begin
    :type target: Integer
    :rtype: Boolean
=end
    def find(target)
      @root.find(target)
    end


end

# Your FindElements object will be instantiated and called as such:
# obj = FindElements.new(root)
# param_1 = obj.find(target)

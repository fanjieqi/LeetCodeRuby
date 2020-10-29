# Definition for a QuadTree node.
class Node
  attr_accessor :val, :isLeaf, :topLeft, :topRight, :bottomLeft, :bottomRight
  def initialize(val=false, isLeaf=false, topLeft=nil, topRight=nil, bottomLeft=nil, bottomRight=nil)
    @val = val
    @isLeaf = isLeaf
    @topLeft = topLeft
    @topRight = topRight
    @bottomLeft = bottomLeft
    @bottomRight = bottomRight
  end

  def or_with(node, val)
    tmp = node&.isLeaf && node&.val || node.nil? && val
    if @isLeaf && (node&.isLeaf || node.nil?)
      @val |= tmp
    else
      @topLeft ||= Node.new(@val, @isLeaf)
      @topLeft.or_with(node&.topLeft, tmp)
      @topRight ||= Node.new(@val, @isLeaf)
      @topRight.or_with(node&.topRight, tmp)
      @bottomLeft ||= Node.new(@val, @isLeaf)
      @bottomLeft.or_with(node&.bottomLeft, tmp)
      @bottomRight ||= Node.new(@val, @isLeaf)
      @bottomRight.or_with(node&.bottomRight, tmp)
      @isLeaf = false
      if @topLeft.isLeaf && @topRight.isLeaf && @bottomLeft.isLeaf && @bottomRight.isLeaf && @topLeft.val == @topRight.val && @topRight.val == @bottomLeft.val && @bottomLeft.val == @bottomRight.val
        @val |= @topLeft.val
        @isLeaf = true
        @topLeft = nil
        @topRight = nil
        @bottomLeft = nil
        @bottomRight = nil
      end
    end
    self
  end
end

# @param {Node} quadTree1
# @param {Node} quadTree2
# @return {Node}
def intersect(quadTree1, quadTree2)
	quadTree1.or_with(quadTree2, nil)
end

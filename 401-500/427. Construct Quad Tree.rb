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

  def build(t, b, l, r)
    if t == b && l == r 
      @val = @@grid[t][l] == 1
      @isLeaf = true
    else
      hm, vm = (t + b)/2, (l + r)/2
      @topLeft = Node.new.build(t, hm, l, vm)
      @topRight = Node.new.build(t, hm, vm+1, r)
      @bottomLeft = Node.new.build(hm+1, b, l, vm)
      @bottomRight = Node.new.build(hm+1, b, vm+1, r)
      if @topLeft.isLeaf && @topRight.isLeaf && @bottomLeft.isLeaf && @bottomRight.isLeaf && @topLeft.val == @topRight.val && @topRight.val == @bottomLeft.val && @bottomLeft.val == @bottomRight.val
        @val = @topLeft.val
        @isLeaf = true
        @topLeft = nil
        @topRight = nil
        @bottomLeft = nil
        @bottomRight = nil
      end
    end
    self
  end

  def self.set_grid(grid)
    @@grid = grid
  end

end

# @param {Integer[][]} grid
# @return {Node}
def construct(grid)
  Node.set_grid(grid)
  n = grid.size
  Node.new.build(0, n-1, 0, n-1)
end

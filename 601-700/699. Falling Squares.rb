class SegmentTree
  attr_accessor :l, :r, :left, :right, :height
  def initialize(l, r, height = nil)
    @l, @r = l, r
    @height, @left, @right = height, nil, nil
  end

  def insert(l, r, height)
    if @l == l && @r == r
      @height, @left, @right = height, nil, nil
    else
      mid = (@l + @r) / 2
      if l <= mid
        @left ||= SegmentTree.new(@l, mid)
        @left.insert(l, [mid, r].min, height)
      end
      if r > mid
        @right ||= SegmentTree.new(mid+1, @r)
        @right.insert([l, mid+1].max, r, height)
      end
      @height = nil
    end
  end

  def find_heightest(l, r)
    if @l <= l && r <= @r && @height
      @height
    else
      mid = (@l + @r) / 2
      if r <= mid
        @left && @left.find_heightest(l, r) || 0
      elsif l > mid
        @right && @right.find_heightest(l, r) || 0
      else
        l_heightest = @left && @left.find_heightest(l, mid) || 0
        r_heightest = @right && @right.find_heightest(mid+1, r) || 0
        [l_heightest, r_heightest, @height.to_i].max
      end
    end
  end
end

# @param {Integer[][]} positions
# @return {Integer[]}
def falling_squares(positions)
  l = positions.map(&:first).min
  r = positions.map { |l, width| l+width-1 }.max
  root = SegmentTree.new(l, r)

  max = 0
  positions.map do |l, width|
    r = l + width -1
    height = root.find_heightest(l, r) + width
    root.insert(l, r, height)
    max = [height, max].max
  end
end

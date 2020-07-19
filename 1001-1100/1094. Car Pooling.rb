class SegmentTree
  attr_accessor :l, :r, :left, :right, :count
  def initialize(l, r, count = nil)
    @l, @r = l, r
    @count, @left, @right = count, nil, nil
  end

  def insert(l, r, count)
    return if l > r
    if @l == l && r == @r && @left.nil? && @right.nil?
      @count = @count.to_i + count
    else
      mid = (@l + @r) / 2
      @left ||= SegmentTree.new(@l, mid, @count)
      @left.insert(l, [mid, r].min, count) if l <= mid
    
      @right ||= SegmentTree.new(mid+1, @r, @count)
      @right.insert([l, mid+1].max, r, count)
      @count = nil
    end
  end

  def find_heightest(l, r)
    if @l <= l && r <= @r && @count
      @count
    else
      mid = (@l + @r) / 2
      if r <= mid
        @left && @left.find_heightest(l, r) || 0
      elsif l > mid
        @right && @right.find_heightest(l, r) || 0
      else
        l_heightest = @left && @left.find_heightest(l, mid) || 0
        r_heightest = @right && @right.find_heightest(mid+1, r) || 0
        [l_heightest, r_heightest, @count.to_i].max
      end
    end
  end
end

# @param {Integer[][]} trips
# @param {Integer} capacity
# @return {Boolean}
def car_pooling(trips, capacity)
  l, r = trips.map { |n1, s1, e1| s1 } .min, trips.map(&:last).max
  root = SegmentTree.new(l, r)
  trips.each do |n1, s1, e1|
    root.insert(s1, e1-1, n1)
  end
  root.find_heightest(l, r) <= capacity
end

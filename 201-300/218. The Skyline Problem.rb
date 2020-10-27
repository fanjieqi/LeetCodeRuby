class SegmentTree
  attr_accessor :l, :r, :left, :right, :height
  def initialize(l, r, height = 0)
    @l, @r = l, r
    @height, @left, @right = height, nil, nil
  end

  def insert(l, r, height)
    return if l > r
    if @l == l && r == @r && @left.nil? && @right.nil?
      @height = height if height > @height
    else
      mid = (@l + @r) / 2
      @left ||= SegmentTree.new(@l, mid, @height)
      @left.insert(l, [mid, r].min, height) if l <= mid

      @right ||= SegmentTree.new(mid+1, @r, @height)
      @right.insert([l, mid+1].max, r, height)
      @height = nil
    end
  end

  def inorder(l, r)
    if @l <= l && r <= @r && @height
      [[l, @height]]
    else
      mid = (@l + @r) / 2
      if r <= mid
        @left && @left.inorder(l, r) || []
      elsif l > mid
        @right && @right.inorder(l, r) || []
      else
        l_array = @left && @left.inorder(l, mid) || []
        r_array = @right && @right.inorder(mid+1, r) || []
        l_array + r_array 
      end
    end
  end
end

# @param {Integer[][]} buildings
# @return {Integer[][]}
def get_skyline(buildings)
  return [] if buildings.empty?
  buildings.sort!
  l = buildings.map(&:first).min
  r = buildings.map { |building| building[1] }.max
  root = SegmentTree.new(l, r)
  buildings.each do |building|
    ll, rr, height = building
    root.insert(ll, rr, height)
  end
  ans = []
  root.inorder(l, r).each do |l, height|
    if ans.empty? || height > ans[-1][1]
      ans << [l, height]
    elsif height < ans[-1][1]
      ans << [l-1, height]
    end
  end
  ans + [[r, 0]]
end

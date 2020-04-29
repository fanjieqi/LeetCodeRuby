MOD = 10**9 + 7

class AreaTree
  attr_accessor :bx, :by, :tx, :ty, :mark, :tl, :tr, :bl, :br, :mx, :my
  def initialize(bx, by, tx, ty, mark = nil)
    @bx, @by, @tx, @ty, @mark = bx, by, tx, ty, mark
  end

  def insert(bx, by, tx, ty, pos)
    return if @mark
    if @bx == bx && @by == by && @tx == tx && @ty == ty
      @mark ||= true
    else
      @mx ||= bx == @bx ? tx : tx == @tx ? bx : (@bx + @tx) / 2
      @my ||= by == @by ? ty : ty == @ty ? by : (@by + @ty) / 2

      if @bx < @mx && @by < @my && bx < [tx, @mx].min && by < [ty, @my].min
        @bl ||= AreaTree.new(@bx, @by, @mx, @my, @mark)
        @bl.insert(bx, by, [tx, @mx].min, [ty, @my].min, :bl) unless @bl.mark
      end

      if @mx < @tx && @my < @ty && [bx, @mx].max < tx && [by, @my].max < ty
        @tr ||= AreaTree.new(@mx, @my, @tx, @ty, @mark)
        @tr.insert([bx, @mx].max, [by, @my].max, tx, ty, :tr) unless @tr.mark
      end
      
      if @bx < @mx && @my < @ty && bx < [tx, @mx].min && [by, @my].max < ty
        @tl ||= AreaTree.new(@bx, @my, @mx, @ty, @mark)
        @tl.insert(bx, [by, @my].max, [tx, @mx].min, ty, :tl) unless @tl.mark
      end

      if @mx < @tx && @by < @my && [bx, @mx].max < tx  && by < [ty, @my].min
        @br ||= AreaTree.new(@mx, @by, @tx, @my, @mark)
        @br.insert([bx, @mx].max, by, tx, [ty, @my].min, :br) unless @br.mark
      end
    end
  end

  def area_size
    if @mark
      (@tx-@bx) * (@ty-@by) % MOD
    else
      sum = 0
      sum += @bl&.area_size || 0
      sum += @tr&.area_size || 0
      sum += @tl&.area_size || 0
      sum += @br&.area_size || 0
      sum %= MOD
    end
  end
end

# @param {Integer[][]} rectangles
# @return {Integer}
def rectangle_area(rectangles)
  bx = rectangles.map { |rectangle| rectangle[0] }.min
  by = rectangles.map { |rectangle| rectangle[1] }.min
  tx = rectangles.map { |rectangle| rectangle[2] }.max
  ty = rectangles.map { |rectangle| rectangle[3] }.max
  tree = AreaTree.new(bx, by, tx, ty)
  rectangles.each do |rectangle|
    tree.insert(*rectangle, :ori)
  end
  tree.area_size
end

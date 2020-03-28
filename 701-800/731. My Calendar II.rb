class MyCalendarTwo
  attr_accessor :l, :r, :left, :right, :count
  def initialize(l = 0, r = 10**9, count = 0)
    @l, @r, @count = l, r, count
  end

  def insert(l, r)
    return if l > r
    if @l == l && r == @r && @left.nil? && @right.nil?
      @count += 1
    else
      mid = (@l + @r) / 2
      @left ||= MyCalendarTwo.new(@l, mid, @count)
      @left.insert(l, [mid, r].min) if l <= mid
    
      @right ||= MyCalendarTwo.new(mid+1, @r, @count)
      @right.insert([l, mid+1].max, r) if r > mid
      @count = 0
    end
  end

  def find_max(l, r, mark = false)
    return 0 if @r < l || @l > r || l > r
    if @left.nil? && @right.nil?
      @count
    else
      mid = (@l + @r) / 2
      [@left&.find_max(l, [mid, r].min, mark).to_i, @right&.find_max([l, mid+1].max, r, mark).to_i].max
    end
  end

=begin
    :type start: Integer
    :type end: Integer
    :rtype: Boolean
=end
    def book(start_at, end_at)
      l, r = start_at, end_at-1
      if find_max(l, r) >= 2
        false
      else
        insert(l, r)
        true
      end
    end
end

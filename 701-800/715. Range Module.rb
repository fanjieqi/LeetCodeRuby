class RangeModule
    def initialize(l = 0, r = 10**9)
      @ranges = []
    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Void
=end
    def add_range(left, right)
      return nil if left >= right
      i = @ranges.bsearch_index { |l, r| r >= left }
      if i.nil?
        @ranges << [left, right]
      elsif right < @ranges[i][0]
        @ranges.insert(i, [left, right])
      else
        @ranges[i][0] = left if left < @ranges[i][0]
        @ranges[i][1] = right if right > @ranges[i][1]
      end
      (0..@ranges.size-1).each do |i|
        while @ranges[i+1] && @ranges[i][1] >= @ranges[i+1][0]
          @ranges[i][1] = [@ranges[i][1], @ranges[i+1][1]].max
          @ranges.delete_at(i+1)
        end
      end
      nil
    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Boolean
=end
    def query_range(left, right)
      i = @ranges.bsearch_index { |l, r| r >= left }
      !i.nil? && @ranges[i][0] <= left && right <= @ranges[i][1]
    end


=begin
    :type left: Integer
    :type right: Integer
    :rtype: Void
=end
    def remove_range(left, right)
      return nil if left >= right
      i = @ranges.bsearch_index { |l, r| r >= left }
      return nil if i.nil? || right <= @ranges[i][0]

      ori_l, ori_r = @ranges[i]
      if left <= @ranges[i][0] && @ranges[i][1] <= right
        @ranges.delete_at(i)
        remove_range(ori_r, right)
      elsif @ranges[i][0] < left && left < @ranges[i][1] && @ranges[i][1] <= right
        @ranges[i][1] = left
        remove_range(ori_r, right)
      elsif left <= @ranges[i][0] && @ranges[i][0] < right && right < @ranges[i][1]
        @ranges[i][0] = right
      elsif @ranges[i][0] < left && right < @ranges[i][1]
        @ranges[i][0] = right
        @ranges.insert(i, [ori_l, left])
      end
      nil
    end


end

# Your RangeModule object will be instantiated and called as such:
# obj = RangeModule.new()
# obj.add_range(left, right)
# param_2 = obj.query_range(left, right)
# obj.remove_range(left, right)

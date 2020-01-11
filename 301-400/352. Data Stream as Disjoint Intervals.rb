class SummaryRanges

=begin
    Initialize your data structure here.
=end
    def initialize()
      @num = {}
    end


=begin
    :type val: Integer
    :rtype: Void
=end
    def add_num(val)
      @num[val] = val
      nil
    end


=begin
    :rtype: Integer[][]
=end
    def get_intervals()
      points = @num.keys.sort
      return points.zip(points) if points.length <= 1
      intervals = []
      i1 = 0
      i2 = 1
      while i2 <= points.length - 1
        i2 += 1 while points[i2] && (points[i2] - points[i2-1]) == 1
        intervals << [points[i1], points[i2-1]]
        i1 = i2
        i2 += 1
      end
      intervals << [points[i1], points[i1]] if i1 == points.length - 1
      intervals
    end


end

# Your SummaryRanges object will be instantiated and called as such:
# obj = SummaryRanges.new()
# obj.add_num(val)
# param_2 = obj.get_intervals()

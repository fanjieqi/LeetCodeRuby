class Solution

=begin
    :type rects: Integer[][]
=end
    def initialize(rects)
      @rects = {}
      @range = 0
      rects.each do |rect|
        x1, y1, x2 , y2 = rect
        x1, x2 = x2, x1 if x1 > x2
        y1, y2 = y2, y1 if y1 > y2
        @range += (x2-x1+1) * (y2-y1+1)
        @rects[@range] = [x1, y1, x2, y2]
      end
    end


=begin
    :rtype: Integer[]
=end
    def pick()
      random = rand(@range+1)
      x1, y1, x2 , y2 = @rects.find{|k, v| k >= random}.last
      [x1 + rand(x2-x1+1), y1 + rand(y2-y1+1)]
    end


end

# Your Solution object will be instantiated and called as such:
# obj = Solution.new(rects)
# param_1 = obj.pick()

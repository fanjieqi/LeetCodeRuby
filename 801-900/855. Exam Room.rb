class ExamRoom

=begin
    :type n: Integer
=end
    def initialize(n)
      @n = n
      @array = []
    end

=begin
    :rtype: Integer
=end
    def seat()
      if @array.empty?
        @array << 0
        0
      else
        ix, pos, max = nil, nil, 0
        ix, pos, max = 0, 0, @array[0] if @array[0] > max
        (1..@array.size-1).each do |i|
          tmp = (@array[i] - @array[i-1]) / 2
          next if tmp <= max
          ix, pos, max = i, @array[i-1] + tmp, tmp
        end
        ix, pos, max = @array.size, @n-1, @n-1-@array[-1] if @n-1-@array[-1] > max
        @array.insert(ix, pos)
        pos
      end
    end

=begin
    :type p: Integer
    :rtype: Void
=end
    def leave(p)
      ix = @array.bsearch_index { |ele| ele >= p }
      @array.delete_at(ix)
      nil
    end

end

# Your ExamRoom object will be instantiated and called as such:
# obj = ExamRoom.new(n)
# param_1 = obj.seat()
# obj.leave(p)

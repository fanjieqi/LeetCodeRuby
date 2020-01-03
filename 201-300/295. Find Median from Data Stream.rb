class MedianFinder

=begin
    initialize your data structure here.
=end
    def initialize()
      @count = 0
      @median = nil
      @heap1 = []
      @heap2 = []
    end

    def maintain_heap1_top
      i = 0
      while i <= (@heap1.length - 1) / 2
        l = i * 2 + 1
        r = i * 2 + 2
        j = @heap1[r] && @heap1[r] > @heap1[l] ? r : l
        if @heap1[j] && @heap1[j] > @heap1[i]
          @heap1[j], @heap1[i] =  @heap1[i], @heap1[j]
          i = j
        else
          break
        end
      end
    end

    def maintain_heap2_top
      i = 0
      while i <= (@heap2.length - 1) / 2
        l = i * 2 + 1
        r = i * 2 + 2
        j = @heap2[r] && @heap2[r] < @heap2[l] ? r : l
        if @heap2[j] && @heap2[j] < @heap2[i]
          @heap2[j], @heap2[i] =  @heap2[i], @heap2[j]
          i = j
        else
          break
        end
      end
    end

    def maintain_heap1_bottom
      i = @heap1.length - 1
      while i > 0 && @heap1[i] > @heap1[(i-1)/2]
        @heap1[(i-1)/2], @heap1[i] = @heap1[i], @heap1[(i-1)/2]
        i = (i-1)/2
      end
    end

    def maintain_heap2_bottom
      i = @heap2.length - 1
      while i > 0 && @heap2[i] < @heap2[(i-1)/2]
        @heap2[(i-1)/2], @heap2[i] = @heap2[i], @heap2[(i-1)/2]
        i = (i-1)/2
      end
    end
=begin
    :type num: Integer
    :rtype: Void
=end
    def add_num(num)
      if @median.nil?
        @median = num
        if @heap1.first && num < @heap1[0]
          @median, @heap1[0]  = @heap1[0], num
          maintain_heap1_top
        end
        if @heap2.first && num > @heap2[0]
          @median, @heap2[0] = @heap2[0], num
          maintain_heap2_top
        end
      elsif
        @heap1 << [num, @median].min
        @heap2 << [num, @median].max
        maintain_heap1_bottom
        maintain_heap2_bottom
        @median = nil
      end
      @count += 1
      nil
    end


=begin
    :rtype: Float
=end
    def find_median()
      @median || (@heap1.first + @heap2.first)/2.0
    end


end

# Your MedianFinder object will be instantiated and called as such:
# obj = MedianFinder.new()
# obj.add_num(num)
# param_2 = obj.find_median()

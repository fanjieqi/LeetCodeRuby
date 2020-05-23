class RLEIterator

=begin
    :type a: Integer[]
=end
    def initialize(a)
      @array = a.each_slice(2).map(&:itself).reject { |count, num| count.zero? }
    end


=begin
    :type n: Integer
    :rtype: Integer
=end
    def next(n)
      return -1 if @array.empty?
      while !@array.empty? && @array[0][0] < n
        n -= @array[0][0]
        @array.shift
      end
      if @array.empty?
        -1
      else
        tmp = @array[0][1]
        @array[0][0] -= n
        @array.shift if @array[0][0].zero?
        tmp
      end
    end


end

# Your RLEIterator object will be instantiated and called as such:
# obj = RLEIterator.new(a)
# param_1 = obj.next(n)

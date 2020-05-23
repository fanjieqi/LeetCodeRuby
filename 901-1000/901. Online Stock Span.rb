class StockSpanner
  def initialize()
    @array, @index, @k = [], [], 0
  end


=begin
  :type price: Integer
  :rtype: Integer
=end
  def next(price)
    i = @array.bsearch_index { |ele| ele > price } || @array.size
    @array.insert(i, price)
    @index.insert(i, @k)
    @k += 1
    maxi = @index[i+1..-1].max
    maxi.nil? ? @array.size : @k - maxi - 1
  end


end

# Your StockSpanner object will be instantiated and called as such:
# obj = StockSpanner.new()
# param_1 = obj.next(price)

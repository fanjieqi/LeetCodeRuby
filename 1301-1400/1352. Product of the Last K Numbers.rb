class ProductOfNumbers
    def initialize()
      @product = [1]
    end


=begin
    :type num: Integer
    :rtype: Void
=end
    def add(num)
      if num == 0
        @product = [1]
      else
        @product << @product[-1] * num
      end
    end


=begin
    :type k: Integer
    :rtype: Integer
=end
    def get_product(k)
      return 0 if k >= @product.size
      @product[-1] / @product[-k-1]
    end


end

# Your ProductOfNumbers object will be instantiated and called as such:
# obj = ProductOfNumbers.new()
# obj.add(num)
# param_2 = obj.get_product(k)

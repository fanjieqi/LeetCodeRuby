class Cashier

=begin
    :type n: Integer
    :type discount: Integer
    :type products: Integer[]
    :type prices: Integer[]
=end
  def initialize(n, discount, products, prices)
    @n, @discount = n, 1-discount/100.0
    @prices = products.zip(prices).to_h
    @count = 0
  end


=begin
    :type product: Integer[]
    :type amount: Integer[]
    :rtype: Float
=end
  def get_bill(product, amount)
    l = product.size
    tmp = (0..l-1).inject(0) { |sum, i| sum + @prices[product[i]] * amount[i] }
    @count += 1
    @count % @n == 0 ? tmp * @discount : tmp
  end


end

# Your Cashier object will be instantiated and called as such:
# obj = Cashier.new(n, discount, products, prices)
# param_1 = obj.get_bill(product, amount)

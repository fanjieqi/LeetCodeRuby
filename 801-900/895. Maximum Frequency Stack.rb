class FreqStack
  def initialize()
    @k, @hash, @count = 0, {}, [[]]
  end


=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    @hash[x] ||= []
    @count[@hash[x].size].delete(x)
    @hash[x] << (@k+=1)
    @count[@hash[x].size] ||= []
    @count[@hash[x].size] << x
    nil
  end


=begin
  :rtype: Integer
=end
  def pop()
    x = @count[-1].pop
    @count.pop if @count[-1].empty?
    @hash[x].pop
    @count[@hash[x].size].reject! { |y| @hash[y].empty? }
    i = @count[@hash[x].size].bsearch_index { |y| @hash[y][-1] >= @hash[x][-1] } || -1
    @count[@hash[x].size].insert(i, x)
    x
  end


end

# Your FreqStack object will be instantiated and called as such:
# obj = FreqStack.new()
# obj.push(x)
# param_2 = obj.pop()

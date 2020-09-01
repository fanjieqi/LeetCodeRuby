class CustomStack
  attr_accessor :stack, :max_size, :values

=begin
  :type max_size: Integer
=end
  def initialize(max_size)
    @stack = []
    @max_size = max_size
    @values = []
  end


=begin
  :type x: Integer
  :rtype: Void
=end
  def push(x)
    return if @stack.size == @max_size
    @stack << x
    @values << 0
  end


=begin
  :rtype: Integer
=end
  def pop()
    if @stack.empty?
      -1
    else
      i = @stack.size - 1
      @values[i-1] += @values[i] if i > 0
      res = @stack.pop + @values[i].to_i
      @values[i] = 0
      res
    end
  end


=begin
  :type k: Integer
  :type val: Integer
  :rtype: Void
=end
  def increment(k, val)
    k = [k, @stack.size].min - 1
    @values[k] += val if k >= 0
  end


end

# Your CustomStack object will be instantiated and called as such:
# obj = CustomStack.new(max_size)
# obj.push(x)
# param_2 = obj.pop()
# obj.increment(k, val)

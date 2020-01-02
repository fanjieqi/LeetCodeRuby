class MyStack

=begin
    Initialize your data structure here.
=end
    def initialize()
      @stack = []
    end


=begin
    Push element x onto stack.
    :type x: Integer
    :rtype: Void
=end
    def push(x)
      @stack << x
    end


=begin
    Removes the element on top of the stack and returns that element.
    :rtype: Integer
=end
    def pop()
      @stack.pop
    end


=begin
    Get the top element.
    :rtype: Integer
=end
    def top()
      @stack.last
    end


=begin
    Returns whether the stack is empty.
    :rtype: Boolean
=end
    def empty()
      @stack.empty?
    end


end

# Your MyStack object will be instantiated and called as such:
# obj = MyStack.new()
# obj.push(x)
# param_2 = obj.pop()
# param_3 = obj.top()
# param_4 = obj.empty()

class MyCircularDeque

=begin
    Initialize your data structure here. Set the size of the deque to be k.
    :type k: Integer
=end
    def initialize(k)
      @queue = []
      @k = k
    end


=begin
    Adds an item at the front of Deque. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
    def insert_front(value)
      @queue.size < @k && @queue.unshift(value) && true
    end


=begin
    Adds an item at the rear of Deque. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
    def insert_last(value)
      @queue.size < @k && @queue.append(value) && true
    end


=begin
    Deletes an item from the front of Deque. Return true if the operation is successful.
    :rtype: Boolean
=end
    def delete_front()
      @queue.size > 0 && @queue.shift && true
    end


=begin
    Deletes an item from the rear of Deque. Return true if the operation is successful.
    :rtype: Boolean
=end
    def delete_last()
      @queue.size > 0 && @queue.pop && true
    end


=begin
    Get the front item from the deque.
    :rtype: Integer
=end
    def get_front()
      @queue.first || -1
    end


=begin
    Get the last item from the deque.
    :rtype: Integer
=end
    def get_rear()
      @queue.last || -1
    end


=begin
    Checks whether the circular deque is empty or not.
    :rtype: Boolean
=end
    def is_empty()
      @queue.empty?
    end


=begin
    Checks whether the circular deque is full or not.
    :rtype: Boolean
=end
    def is_full()
      @queue.size == @k
    end


end

# Your MyCircularDeque object will be instantiated and called as such:
# obj = MyCircularDeque.new(k)
# param_1 = obj.insert_front(value)
# param_2 = obj.insert_last(value)
# param_3 = obj.delete_front()
# param_4 = obj.delete_last()
# param_5 = obj.get_front()
# param_6 = obj.get_rear()
# param_7 = obj.is_empty()
# param_8 = obj.is_full()

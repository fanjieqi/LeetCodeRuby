class MyCircularQueue

=begin
    Initialize your data structure here. Set the size of the queue to be k.
    :type k: Integer
=end
    def initialize(k)
      @queue = []
      @k = k
    end


=begin
    Insert an element into the circular queue. Return true if the operation is successful.
    :type value: Integer
    :rtype: Boolean
=end
    def en_queue(value)
      return false if @queue.size == @k
      @queue << value
      true
    end


=begin
    Delete an element from the circular queue. Return true if the operation is successful.
    :rtype: Boolean
=end
    def de_queue()
      return false if @queue.size == 0
      @queue.shift
      true
    end


=begin
    Get the front item from the queue.
    :rtype: Integer
=end
    def front()
      @queue.first || -1
    end


=begin
    Get the last item from the queue.
    :rtype: Integer
=end
    def rear()
      @queue.last || -1
    end


=begin
    Checks whether the circular queue is empty or not.
    :rtype: Boolean
=end
    def is_empty()
      @queue.empty?
    end


=begin
    Checks whether the circular queue is full or not.
    :rtype: Boolean
=end
    def is_full()
      @queue.size == @k
    end


end

# Your MyCircularQueue object will be instantiated and called as such:
# obj = MyCircularQueue.new(k)
# param_1 = obj.en_queue(value)
# param_2 = obj.de_queue()
# param_3 = obj.front()
# param_4 = obj.rear()
# param_5 = obj.is_empty()
# param_6 = obj.is_full()

# circularQueue = MyCircularQueue.new(3)
# p circularQueue.en_queue(1) == true
# p circularQueue.en_queue(2) == true
# p circularQueue.en_queue(3) == true
# p circularQueue.en_queue(4) == false
# p circularQueue.rear() == 3
# p circularQueue.is_full() == true
# p circularQueue.de_queue() == true
# p circularQueue.en_queue(4) == true
# p circularQueue.rear() == 4
